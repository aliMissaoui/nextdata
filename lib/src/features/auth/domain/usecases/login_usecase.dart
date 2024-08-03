import 'package:nextdata/src/features/auth/domain/entities/user.dart';

import '../../../../core/error/result.dart';
import '../../data/repositories/authentication_repository.dart';

/// Use case responsible for handling user login functionality.
class LoginUseCase {
  final AuthRepository repository;

  /// Constructor that requires an instance of [AuthRepository].
  LoginUseCase(this.repository);

  /// Executes the login operation.
  ///
  /// Returns a [Result] containing a [User] if successful, or an Exception if unsuccessful.
  Future<Result<User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
