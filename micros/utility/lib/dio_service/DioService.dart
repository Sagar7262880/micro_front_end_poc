import 'dart:async';
import 'dart:developer'; // Import the log function
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:utility/shared_pref_service/SharedService.dart';
import 'package:utility/util/DialogBuilder.dart';
import 'package:utility/util/Singleton.dart';

class DioService {
  static Dio? _dio;
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    log("DioService factory called.");
    return _singleton;
  }

  DioService._internal() {
    log("DioService singleton instance created.");
    initializeDio();
  }

  static Map<String, String> getHeader() {
    log("Fetching headers...");
    var token = SharedService().getToken();
    log("Token fetched: ${token.isNotEmpty ? 'Exists' : 'Empty'}");
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static Future<void> initializeDio() async {
    log("Initializing Dio instance...");
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.infogird.com/prod/api/',
        // receiveDataWhenStatusError: true,
        persistentConnection: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 90),
        headers: getHeader(),
      ),
    );

    log("Adding interceptors...");
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("Request initiated: ${options.method} ${options.path}");
          if (options.data != null) log("Request data: ${options.data}");
          handler.next(options);
        },
        onError: (e, handler) async {
          log("Error occurred: ${e.message}");
          if (e.response != null && e.response!.statusCode == 401) {
            log("Unauthorized error (401). Attempting token refresh...");
            if (await refreshToken()) {
              log("Token refreshed successfully. Retrying request...");
              var requestOptions = e.requestOptions;
              _dio!.options.headers = getHeader();
              final opts = Options(method: requestOptions.method);
              final response = await _dio!.request(
                requestOptions.path,
                options: opts,
                cancelToken: requestOptions.cancelToken,
                onReceiveProgress: requestOptions.onReceiveProgress,
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
              );
              return handler.resolve(response);
            } else {
              log("Token refresh failed.");
              return handler.next(e);
            }
          } else if (e.response != null && e.response!.statusCode == 403) {
            log("Access Denied (403).");
            e.response!.data = {"errors": "Access Denied"};
            e.response!.statusCode = 403;
            return handler.resolve(e.response!);
          }
          return handler.next(e);
        },
        onResponse: (response, handler) {
          var url = response.requestOptions.path;
          String responseData = response.data != null
              ? response.data.toString()
              : 'No response data';
          log("Response received for URL: $url\nStatus code: ${response.statusCode} Response data: ${responseData.length > 100000 ? "Large data, enable to print log!" : responseData}");
          handler.next(response);
        },
      ),
    );
    log("Dio instance initialized successfully.");
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? params, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        res = await _dio!.get(url, queryParameters: params);
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in GET request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  Future<Response> post(String url,
      {dynamic data, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        res = await _dio!.post(url, data: data);
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in POST request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  Future<Response> download(String url, String path,
      {dynamic data, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        res = await _dio!.download(
          url,
          path,
          data: data,
        );
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in POST request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  Future<Response> delete(String url,
      {dynamic data, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        res = await _dio!.delete(url, data: data);
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in DELETE request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  Future<Response> patch(String url,
      {dynamic data, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        res = await _dio!.patch(url, data: data);
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in PATCH request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  Future<Response> postMultipart(String url, dynamic data,
      {bool isContentTypeJson = false, bool isShowLoading = true}) async {
    if (await Singleton.isOnline()) {
      Response? res;
      try {
        if (isShowLoading) DialogBuilder.showLoadingIndicator(true);
        if (!isContentTypeJson) {
          _dio!.options.headers["Content-Type"] = "multipart/form-data";
        }
        res = await _dio!.post(url, data: data);
        _dio!.options.headers = getHeader();
        if (isShowLoading) DialogBuilder.hideOpenDialog();
      } catch (e) {
        if (isShowLoading) DialogBuilder.hideOpenDialog();
        log("Error in POST Multipart request: $e");
        rethrow;
      }
      return res;
    } else {
      showNoInternetConnectionDialog();
      return Response(
        data: {},
        statusCode: 408,
        requestOptions: RequestOptions(path: url),
      );
    }
  }

  static Future<bool> refreshToken() async {
    log("Refreshing token...");
    var dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    var refreshToken = SharedService().getToken();
    Map<String, dynamic> body = {'token': refreshToken, 'is_mobile': true};
    try {
      var response = await dio.post("", data: body);
      log("Token refresh response: ${response.statusCode}");
      if (response.statusCode == 200 && response.data["status"] == "true") {
        var data = response.data;
        log("New access token: ${data["accessToken"]}");
        SharedService().setString('accessToken', data["accessToken"]);
        if (data.containsKey("refreshToken")) {
          log("New refresh token: ${data["refreshToken"]}");
          SharedService().setString('refreshToken', data["refreshToken"]);
        }
        return true;
      } else if (response.statusCode == 401) {
        showSessionOutDialog();
      }
    } catch (e, stackTrace) {
      log("Error during token refresh: $e", stackTrace: stackTrace);
    }
    return false;
  }

  static showSessionOutDialog() {
    DialogBuilder.hideOpenDialog();
    Get.defaultDialog(
      title: 'Session Expired',
      contentPadding: const EdgeInsets.all(20),
      barrierDismissible: false,
      // User must tap the button
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
      content: const Column(
        children: [
          Text(
            'Your session has expired. Please log in again to continue.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 20),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back(); // Close the dialog
          // Get.to(Apply)
          // Get.offAllNamed('/login'); // Navigate to the login screen
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  void showNoInternetConnectionDialog() {
    Singleton.showImageDialog("No connection",
        "Please check your internet connection", "assets/checkinternet.png");
  }
}
