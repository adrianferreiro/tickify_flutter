import 'package:dio/dio.dart';
import 'package:tickify_flutter/core/domain/repositories/local_storage_repository.dart';
import 'package:tickify_flutter/core/network/api_paths.dart';
import 'package:tickify_flutter/core/network/auth_interceptor.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio, required LocalStorageRepository localStorage}) {
    dio.options = BaseOptions(
      baseUrl: ApiPaths.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      validateStatus: (status) => true,
    );

    dio.interceptors.add(AuthInterceptor(localStorage));
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
  }
}
