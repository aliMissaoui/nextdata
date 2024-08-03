import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';

/// Widget for displaying a login button with optional loading indicator.
class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          context.read<AuthBloc>().add(
                LoginEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
          ),
          padding: EdgeInsets.symmetric(vertical: ThemeDimens.sizex16)),
      child: isLoading
          ? SpinKitPulse(
              color: ThemeColors.whiteColor,
              size: ThemeDimens.sizex24 * 2,
            )
          : Text(
              ThemeConstants.login,
              style: TextStyle(
                  color: ThemeColors.whiteColor, fontWeight: FontWeight.w600),
            ),
    );
  }
}
