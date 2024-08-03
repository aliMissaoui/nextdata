import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

/// Business Logic Component (BLoC) for handling authentication-related events and states.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isBoxChecked = false;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(AuthInitial()) {
    // Initialize event handlers for specific events.
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibility);
    on<ToggleConfirmPasswordVisibilityEvent>(
        _onToggleConfirmPasswordVisibility);
  }

  /// Handles the [LoginEvent] by emitting appropriate states.
  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); // Notify UI that login process has started.
    try {
      final result = await loginUseCase(event.email, event.password);

      // Handle the result of the login use case.
      result.when(
        success: (user) => emit(Authenticated(user)), // User authenticated.
        failure: (error) => emit(AuthError(error.message)), // Login failed.
      );
    } catch (e) {
      emit(AuthError('An unexpected error occurred.'));
    }
  }

  /// Handles the [RegisterEvent] by emitting appropriate states.
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); // Notify UI that registration process has started.
    try {
      final result = await registerUseCase(
          event.phoneNumber, event.email, event.password, event.verifyPassword);

      // Handle the result of the register use case.
      result.when(
        success: (user) => emit(Authenticated(user)), // User registered.
        failure: (error) =>
            emit(AuthError(error.message)), // Registration failed.
      );
    } catch (e) {
      emit(AuthError('An unexpected error occurred.'));
    }
  }

  /// Toggles the visibility of the password field.
  void _onTogglePasswordVisibility(
      TogglePasswordVisibilityEvent event, Emitter<AuthState> emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthPasswordVisibilityToggled(isPasswordVisible: isPasswordVisible));
  }

  /// Toggles the visibility of the password field.
  void _onToggleConfirmPasswordVisibility(
      ToggleConfirmPasswordVisibilityEvent event, Emitter<AuthState> emit) {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(AuthConfirmPasswordVisibilityToggled(
        isConfirmPasswordVisible: isConfirmPasswordVisible));
  }
}
