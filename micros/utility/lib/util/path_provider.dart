import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:utility/util/permission_handler.dart';

enum PathType {
  temporary,
  applicationDocuments,
  applicationSupport,
  externalStorage, // Available on Android
}

enum Folder { InfogirdApp, Download }

class PathProvider {
  static Future<String?> getPath(PathType pathType,
      {String? customDirectory}) async {
    try {
      Directory? baseDirectory;
      // Fetch the base directory based on the PathType
      switch (pathType) {
        case PathType.temporary:
          baseDirectory = await getTemporaryDirectory();
          break;
        case PathType.applicationDocuments:
          baseDirectory = await getApplicationDocumentsDirectory();
          break;
        case PathType.applicationSupport:
          baseDirectory = await getApplicationSupportDirectory();
          break;
        case PathType.externalStorage:
          if (Platform.isAndroid) {
            baseDirectory = await getExternalStorageDirectory();
          } else {
            throw UnsupportedError(
                'External storage is not supported on this platform.');
          }
          break;
      }
      // If a custom directory is specified, append it to the base path
      if (customDirectory != null && baseDirectory != null) {
        final customPath = Directory('${baseDirectory.path}/$customDirectory');
        // Ensure the custom directory exists
        if (!await customPath.exists()) {
          await customPath.create(recursive: true);
        }

        return customPath.path;
      }

      return baseDirectory?.path;
    } catch (e) {
      print('Error fetching path: $e');
      return null;
    }
  }

  static Future<dynamic> getExternalFolder(
      {Folder folder = Folder.InfogirdApp}) async {
    Directory? directory;
    //
    // try {
    //   final folderName = folder.name;
    //   if (Platform.isAndroid) {
    //     // if (await PermissionHandler.requestStoragePermission()) {
    //     //if (await Permission.storage.request().isGranted) {
    //     directory = await getExternalStorageDirectory();
    //     String newPath = "";
    //     log("Fetched directory: ${directory!.path}");
    //     List<String> paths = directory.path.split("/");
    //     // Construct the path to save the file
    //     for (int x = 1; x < paths.length; x++) {
    //       String folder = paths[x];
    //       if (folder != "Android") {
    //         newPath += "/" + folder;
    //       } else {
    //         break;
    //       }
    //     }
    //     newPath = newPath + "/NewSave"; // Custom folder for your app
    //     directory = Directory(newPath);
    //
    //     return directory.path;
    //     /*  } else {
    //       print("Storage Permission Denied");
    //       return false;
    //     } */
    //   } else {
    //     // iOS handling: Use the temporary directory
    //     directory = await getTemporaryDirectory();
    //   }
    //
    //   // Create the directory if it doesn't exist
    //   if (!await directory.exists()) {
    //     await directory.create(recursive: true);
    //   }
    //   // }
    //   // Proceed with the download if the directory exists
    // } catch (e) {
    //   print("Error saving file: $e");
    // }
    // return "";

    try {
      if (Platform.isAndroid) {
        //if (await Permission.storage.request().isGranted) {
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");

        // Construct the path to save the file
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/ESSApp"; // Custom folder for your app
        directory = Directory(newPath);
        print("================" + directory.path);
        /*  } else {
          print("Storage Permission Denied");
          return false;
        } */
      } else {
        // iOS handling: Use the temporary directory
        directory = await getTemporaryDirectory();
      }

      // Create the directory if it doesn't exist
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Proceed with the download if the directory exists
    } catch (e) {
      print("Error saving file: $e");
    }
    return false;
  }
}
