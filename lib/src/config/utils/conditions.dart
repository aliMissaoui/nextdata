import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Helper class for checking various conditions related to the app mechanism.
class ConditionsHelper {
  /// Checks if the provided email address is valid.
  bool isEmailValid(String email) {
    // Regular expression for validating email format
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }

  /// Checks if the provided access token is still valid based on its expiration time.
  ///
  /// [expiresIn]: Duration in seconds until the access token expires.
  bool _isTokenExpired(String token) {
    try {
      // Calculate current time
      DateTime currentTime = DateTime.now();

      final jwt = JWT.decode(token);
      final DateTime? expiresAt = jwt.payload['exp'];
      return expiresAt != null && expiresAt.isBefore(currentTime);
    } catch (e) {
      // Consider token expired if parsing fails.
      return true;
    }
  }

  /// Determines the initial route of the application based on token validation.
  Future<String> determineInitialRoute() async {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'accessToken');

    if (accessToken != null) {
      return '/home';
    } else {
      return '/opening';
    }
  }
}
