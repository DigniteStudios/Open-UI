// lib/core/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../constants/api_endpoints.dart';
import '../errors/exceptions.dart';

class ApiService {
  final Dio _dio;

  ApiService({String? baseUrl})
      : _dio = Dio(BaseOptions(
    baseUrl: baseUrl ?? kBaseURL,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  )) {
    // Add interceptors if needed
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      request: true
    ));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      // Handle errors
      throw Exception('GET request error: ${e.message}');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      // Handle errors
      if(e.response?.data is String) {
        throw ServerException(e.response?.data);
      }
      else {
        throw ServerException('POST request error: ${e.message}');
      }
    }
  }

// Similarly, implement put, delete, etc.
}
