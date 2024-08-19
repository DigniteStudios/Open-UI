import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:open_ui/utils/storage.dart';

enum DioMethod { post, get, put, delete }

class Network {
  Network._singleton();

  static final Network instance = Network._singleton();

  late final Dio dio;

  init() {
    dio = Dio(
      BaseOptions(
        // baseUrl: baseUrl,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
  }

  Future<dynamic> get(String endPoint, {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? headers,
      }) async {
    try {
      Response res = await dio.get(endPoint,
          queryParameters: queryParams,
        options: Options(
          headers: headers,
        )
      );
    }
    on DioException catch(e) {
      rethrow;
    }
  }

  Future<dynamic> post(String endPoint, {
    Map<String, dynamic>? queryParams,
    Object? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response res = await dio.post(endPoint,
          queryParameters: queryParams,
          data: body,
          options: Options(
            headers: headers,
          )
      );
    }
    on DioException catch(e) {
      rethrow;
    }
  }

  Future<FormData> createFormData({
    required String fileKey,
    required String filePath,
    List<String> files = const [],
  }) async {
    FormData formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(filePath, filename: filePath.split('/').last),
    });

    for (String f in files) {
      formData.files.addAll([
        MapEntry("files[]", await MultipartFile.fromFile(f, filename: f.split('/').last)),
      ]);
    }

    return formData;
  }

  Future<Response> request(
      String endpoint,
      DioMethod method, {
        Map<String, dynamic>? param,
        // String? contentType,
        formData,
      }) async {
    try {
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }
}