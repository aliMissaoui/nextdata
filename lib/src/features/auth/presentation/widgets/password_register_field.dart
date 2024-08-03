import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';

/// Widget for displaying a password field.
class PasswordRegisterField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final bool labeled;

  const PasswordRegisterField({
    super.key,
    required this.passwordController,
    required this.isPasswordVisible,
    this.labeled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labeled)
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
            hintText: ThemeConstants.passwordHint,
            hintStyle: TextStyle(color: ThemeColors.grayTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
              borderSide: BorderSide(color: ThemeColors.lightMainColor),
            ),
            filled: true,
            fillColor: ThemeColors.whiteColor,
            suffixIcon: IconButton(
              onPressed: () {
                labeled
                    ? context
                        .read<AuthBloc>()
                        .add(TogglePasswordVisibilityEvent())
                    : context
                        .read<AuthBloc>()
                        .add(ToggleConfirmPasswordVisibilityEvent());
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
