import 'package:dio/dio.dart';
import 'package:tickify_flutter/config/constants/storage_keys.dart';
import 'package:tickify_flutter/core/domain/repositories/local_storage_repository.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorageRepository localStorage;

  AuthInterceptor(this.localStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.path.contains('login') && !options.path.contains('register')) {
      final token = await localStorage.getString(StorageKeys.authToken);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return handler.next(options);
  }
}
