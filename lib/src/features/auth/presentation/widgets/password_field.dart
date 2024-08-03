import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';

/// Widget for displaying a password field.
class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isPasswordVisible;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.isPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ThemeConstants.password,
          style: TextStyle(
            color: ThemeColors.labelTextColor,
            fontSize: ThemeDimens.sizex16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: ThemeDimens.sizex08),
        TextFormField(
          controller: passwordController,
          obscureText: !isPasswordVisible,
          style: TextStyle(
              color: ThemeColors.labelTextColor, fontSize: ThemeDimens.sizex14),
          decoration: InputDecoration(
            hintText: ThemeConstants.password,
            hintStyle: TextStyle(color: ThemeColors.grayTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
              borderSide: BorderSide(color: ThemeColors.lightMainColor),
            ),
            filled: true,
            fillColor: ThemeColors.whiteColor,
            suffixIcon: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
              },
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: ThemeColors.grayTextColor,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ThemeConstants.pleaseEnterYourPassword;
            }
            return null;
          },
        ),
      ],
    );
  }
}
