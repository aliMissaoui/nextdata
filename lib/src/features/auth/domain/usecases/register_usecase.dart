import 'package:nextdata/src/features/auth/domain/entities/user.dart';

import '../../../../core/error/result.dart';
import '../../data/repositories/authentication_repository.dart';

/// Use case responsible for handling user registration logic.
class RegisterUseCase {
  final AuthRepository repository;

  /// Constructor that takes an [AuthRepository] instance.
  RegisterUseCase(this.repository);

  /// Executes the use case to register a new user.
  ///
  /// Returns a [Result] containing a [User] if successful,
  /// or an Exception if registration fails.
  Future<Result<User>> call(String phoneNumber, String email, String password,
      String verifyPassword) async {
    return await repository.register(
        phoneNumber, email, password, verifyPassword);
  }
}
