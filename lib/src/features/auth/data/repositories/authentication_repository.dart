import 'package:nextdata/src/core/error/result.dart';
import 'package:nextdata/src/features/auth/domain/entities/user.dart';

/// Abstract class representing authentication operations.
abstract class AuthRepository {
  /// Authenticates a user with the provided [email] and [password].
  ///
  /// Returns a [Future] that resolves to a [Result] containing a [User] if successful,
  /// or an error if authentication fails.
  Future<Result<User>> login(String email, String password);

  /// Registers a new user with the provided [phoneNumber], [email], [password], and [verifyPassword].
  ///
  /// Returns a [Future] that resolves to a [Result] containing a [User] if registration is successful,
  /// or an error if registration fails.
  Future<Result<User>> register(
      String phoneNumber, String email, String password, String verifyPassword);

  /// Refresh the access token.
  ///
  /// Returns a [Future] that resolves to a [Result] containing a [String] if the refresh is successful,
  /// or an error if the refresh fails.
  Future<Result<String?>> refreshAccessToken();
}
