import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';
import 'package:nextdata/src/features/auth/presentation/widgets/error_msg.dart';
import 'package:nextdata/src/injection_container.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_state.dart';
import '../widgets/auth_header_section.dart';
import '../widgets/email_address_field.dart';
import '../widgets/name_field.dart';
import '../widgets/password_register_field.dart';
import '../widgets/register_btn.dart';

/// Login screen widget for user authentication.
class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // Handle authentication state changes
            if (state is AuthError) {
              // Handle authentication error state
            } else if (state is Authenticated) {
              // Navigate to home screen on successful authentication
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          builder: (context, state) {
            bool isStateLoading = state is AuthLoading;
            bool isPasswordVisible = state is AuthPasswordVisibilityToggled &&
                state.isPasswordVisible;
            bool isConfirmPasswordVisible =
                state is AuthConfirmPasswordVisibilityToggled &&
                    state.isConfirmPasswordVisible;
            bool isFailed = state is AuthError;

            return Padding(
              padding: EdgeInsets.all(ThemeDimens.sizex24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ThemeDimens.sizex24 * 2),
                        child: SvgPicture.asset(
                          ThemeConstants.nextdataLogo,
                          semanticsLabel: ThemeConstants.nextdataLogoLabel,
                        ),
                      ),
                      const AuthHeader(
                        headerText: ThemeConstants.wlcToNextData,
                        descriptionText: ThemeConstants.createAnAccount,
                      ),
                      SizedBox(height: ThemeDimens.sizex24 * 2),
                      NameField(nameController: nameController),
                      SizedBox(height: ThemeDimens.sizex16),
                      EmailAddressField(emailController: emailController),
                      SizedBox(height: ThemeDimens.sizex16),
                      PasswordRegisterField(
                          passwordController: passwordController,
                          isPasswordVisible: isPasswordVisible),
                      SizedBox(height: ThemeDimens.sizex10),
                      PasswordRegisterField(
                          passwordController: confirmPasswordController,
                          isPasswordVisible: isConfirmPasswordVisible,
                          labeled: false),
                      SizedBox(height: ThemeDimens.sizex24),
                      SignUpButton(
                          formKey: _formKey,
                          isLoading: isStateLoading,
                          emailController: emailController,
                          passwordController: passwordController),
                      ErrorMsg(
                        failureMsg: ThemeConstants.failedLogin,
                        isFailed: isFailed,
                      ),
                      SizedBox(height: ThemeDimens.sizex12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
