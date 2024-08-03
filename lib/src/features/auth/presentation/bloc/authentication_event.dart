import 'package:equatable/equatable.dart';

/// Base class for authentication events.
///
/// All events related to authentication should extend this class.
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event for logging in a user.
///
/// This event contains the email and password required for login.
class LoginEvent extends AuthEvent {
  /// The email of the user.
  final String email;

  /// The password of the user.
  final String password;

  /// Creates a [LoginEvent] with the given [email] and [password].
  LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

/// Event for registering a new user.
///
/// This event contains the phone number, email, password, and
/// verification password required for registration.
class RegisterEvent extends AuthEvent {
  /// The phone number of the user.
  final String phoneNumber;

  /// The email of the user.
  final String email;

  /// The password of the user.
  final String password;

  /// The verification password of the user.
  final String verifyPassword;

  /// Creates a [RegisterEvent] with the given [phoneNumber], [email],
  /// [password], and [verifyPassword].
  RegisterEvent({
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.verifyPassword,
  });

  @override
  List<Object?> get props => [phoneNumber, email, password, verifyPassword];
}

/// Event for toggling password visibility.
///
/// This event is used to show or hide the password in the UI.
class TogglePasswordVisibilityEvent extends AuthEvent {}

/// Event for toggling confirm password visibility.
///
/// This event is used to show or hide the confirm password in the UI.
class ToggleConfirmPasswordVisibilityEvent extends AuthEvent {}
