import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart' as imgpicker;
import 'package:path_provider/path_provider.dart';

class ImagePicker {
  static Future<dynamic> pickImage({
    bool isMultipleFile = false,
    bool isFromFile = false,
    bool isImgCropeble = false,
    bool isOnlyImage = false,
    bool isOnlyCamera = false,
  }) async {
    dynamic selectedImage;

    await showModalBottomSheet(
      context: Get.context!,
      builder: (context) => _buildBottomSheet(context, isMultipleFile,
          isFromFile, isImgCropeble, isOnlyImage, isOnlyCamera, (image) {
        selectedImage = image;
      }),
    );

    return selectedImage;
  }

  static Widget _buildBottomSheet(
    BuildContext context,
    bool isMultipleFile,
    bool isFromFile,
    bool isImgCropeble,
    bool isOnlyImage,
    bool isOnlyCamera,
    Function(dynamic) onImagePicked,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height / 4.5,
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!isMultipleFile)
                _buildOption(context, Icons.camera_alt_sharp, "Camera",
                    () async {
                  var image = await _pickImage(imgpicker.ImageSource.camera,
                      isMultipleFile, isImgCropeble);
                  Navigator.pop(context);
                  onImagePicked(image);
                }),
              if (!isOnlyCamera)
                _buildOption(context, Icons.image, "Gallery", () async {
                  var image = await _pickImage(imgpicker.ImageSource.gallery,
                      isMultipleFile, isImgCropeble);
                  Navigator.pop(context);
                  onImagePicked(image);
                }),
              if (isFromFile && !isOnlyCamera)
                _buildOption(context, Icons.drive_file_move_rounded, "Browse",
                    () async {
                  var image = await _pickFile(isMultipleFile, isOnlyImage);
                  Navigator.pop(context);
                  onImagePicked(image);
                }),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildOption(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Theme.of(context).primaryColor),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  static Future<dynamic> _pickImage(
    imgpicker.ImageSource source,
    bool isMultipleFile,
    bool isImgCropeble,
  ) async {
    final picker = imgpicker.ImagePicker();
    dynamic selectedImage;

    if (isMultipleFile && source != imgpicker.ImageSource.camera) {
      var images = await picker.pickMultiImage();
      if (images != null) {
        selectedImage = await Future.wait(
            images.map((img) => _compressFile(File(img.path))));
      }
    } else {
      var pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        if (isImgCropeble) {
          selectedImage = await _cropImage(File(pickedFile.path));
        }
        selectedImage = await _compressFile(selectedImage);
      }
    }

    return selectedImage;
  }

  static Future<File?> _cropImage(File file) async {
    var croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );
    return croppedImage != null ? File(croppedImage.path) : null;
  }

  static Future<File> _compressFile(File file) async {
    final tempDir = await getApplicationDocumentsDirectory();
    final compressedImagePath = '${tempDir.path}/compressed_image.png';

    var result = await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 35,
    );

    if (result != null) {
      final compressedFile = File(compressedImagePath);
      await compressedFile.writeAsBytes(result);
      return compressedFile;
    } else {
      return file;
    }
  }

  static Future<dynamic> _pickFile(
      bool isMultipleFile, bool isOnlyImage) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: isMultipleFile,
      allowedExtensions: isOnlyImage
          ? ['jpg', 'png', 'jpeg']
          : ['jpg', 'pdf', 'png', 'jpeg', 'txt'],
    );

    if (result != null && result.files.isNotEmpty) {
      return isMultipleFile
          ? result.files.map((file) => File(file.path!)).toList()
          : File(result.files.first.path!);
    }
  }
}
