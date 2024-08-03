import 'package:flutter/material.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

/// Represents a custom email input field widget.
class EmailAddressField extends StatelessWidget {
  final TextEditingController emailController;

  /// Constructor for EmailAddressField.
  ///
  /// Required parameters:
  /// - [emailController]: Controller for managing the email input field.
  const EmailAddressField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ThemeConstants.emailAddress,
          style: TextStyle(
            color: ThemeColors.labelTextColor,
            fontSize: ThemeDimens.sizex16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: ThemeDimens.sizex08),
        TextFormField(
          controller: emailController,
          style: TextStyle(
              color: ThemeColors.labelTextColor, fontSize: ThemeDimens.sizex14),
          decoration: InputDecoration(
            hintText: ThemeConstants.emailHint,
            hintStyle: TextStyle(color: ThemeColors.grayTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
              borderSide: BorderSide(color: ThemeColors.lightMainColor),
            ),
            filled: true,
            fillColor: ThemeColors.whiteColor,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ThemeConstants.pleaseEnterYourEmailAddress;
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return ThemeConstants.pleaseEnterValidEmailAddress;
            }
            return null;
          },
        ),
      ],
    );
  }
}
