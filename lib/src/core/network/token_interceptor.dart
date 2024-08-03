import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/data/repositories/authentication_repository.dart';

/// Interceptor for handling token management in Dio HTTP requests.
class TokenInterceptor extends Interceptor {
  /// Secure storage for storing and retrieving tokens.
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  /// Repository for handling authentication-related operations.
  final AuthRepository authRepository;

  /// Constructs a [TokenInterceptor] with the provided [authRepository].
  TokenInterceptor({
    required this.authRepository,
  });

  /// Intercepts outgoing requests to add the Authorization header with the access token.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: 'accessToken');
    if (accessToken != null && await isTokenExpired(accessToken)) {
      final newAccessTokenResult = await authRepository.refreshAccessToken();
      if (newAccessTokenResult.isSuccess) {
        final newAccessToken = newAccessTokenResult.value;
        await storage.write(key: 'accessToken', value: newAccessToken);
        options.headers['Authorization'] = 'Bearer $newAccessToken';
      }
    } else if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  /// Intercepts failed responses to handle token refresh and retry the request.
  @override
  Future<void> onError(
      DioException exp, ErrorInterceptorHandler handler) async {
    if (exp.response?.statusCode == 401) {
      final newAccessTokenResult = await authRepository.refreshAccessToken();
      if (newAccessTokenResult.isSuccess) {
        final newAccessToken = newAccessTokenResult.value;
        await storage.write(key: 'accessToken', value: newAccessToken);
        exp.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        final cloneRequest = await _retry(exp.requestOptions);
        return handler.resolve(cloneRequest);
      }
    }
    return handler.next(exp);
  }

  /// Retries a failed request with updated options.
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request(
      requestOptions.path,
      options: options,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }

  /// Checks if the given token is expired.
  ///
  /// Returns true if the token is expired or if there is an error decoding the token.
  Future<bool> isTokenExpired(String token) async {
    try {
      final jwt = JWT.decode(token);
      final DateTime? expiresAt = jwt.payload['exp'];
      return expiresAt != null && expiresAt.isBefore(DateTime.now());
    } catch (e) {
      // Consider token expired if parsing fails
      return true;
    }
  }
}
