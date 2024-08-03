import 'package:flutter/material.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

/// Represents a custom form field widget for authentication screens.
class AuthFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  /// Constructor for AuthFormField.
  ///
  /// Required parameters:
  /// - [label]: The label text for the form field.
  /// - [controller]: Controller for managing the text field's text.
  /// - [hintText]: Hint text displayed when the field is empty.
  /// - [validator]: Validator function to validate the input.
  const AuthFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: ThemeColors.blackColor,
            fontSize: ThemeDimens.sizex16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: ThemeDimens.sizex08),
        TextFormField(
          controller: controller,
          style: TextStyle(color: ThemeColors.blackColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[800]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            filled: true,
            fillColor: Colors.grey.shade900,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
