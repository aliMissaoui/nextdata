import 'package:equatable/equatable.dart';
import 'package:nextdata/src/features/auth/domain/entities/user.dart';

/// Base class for all authentication states.
///
/// This class extends [Equatable] to enable value comparison.
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state of the authentication process.
class AuthInitial extends AuthState {}

/// State indicating that an authentication process is ongoing.
class AuthLoading extends AuthState {}

/// State indicating that the user has been successfully authenticated.
class Authenticated extends AuthState {
  /// The authenticated [User] object.
  final User user;

  /// Constructor for the [Authenticated] state.
  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

/// State indicating that an error occurred during authentication.
class AuthError extends AuthState {
  /// The error message.
  final String message;

  /// Constructor for the [AuthError] state.
  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

/// State indicating that the visibility of the password has been toggled.
class AuthPasswordVisibilityToggled extends AuthState {
  /// Boolean indicating whether the password is visible.
  final bool isPasswordVisible;

  /// Constructor for the [AuthPasswordVisibilityToggled] state.
  AuthPasswordVisibilityToggled({required this.isPasswordVisible});

  @override
  List<Object?> get props => [isPasswordVisible];
}

/// State indicating that the visibility of the confirm password has been toggled.
class AuthConfirmPasswordVisibilityToggled extends AuthState {
  /// Boolean indicating whether the confirm password is visible.
  final bool isConfirmPasswordVisible;

  /// Constructor for the [AuthConfirmPasswordVisibilityToggled] state.
  AuthConfirmPasswordVisibilityToggled(
      {required this.isConfirmPasswordVisible});

  @override
  List<Object?> get props => [isConfirmPasswordVisible];
}
