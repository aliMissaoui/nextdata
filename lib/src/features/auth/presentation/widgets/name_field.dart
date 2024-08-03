import 'package:flutter/material.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

/// Represents a custom name input field widget.
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  /// Constructor for NameField.
  ///
  /// Required parameters:
  /// - [nameController]: Controller for managing the email input field.
  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ThemeConstants.name,
          style: TextStyle(
            color: ThemeColors.labelTextColor,
            fontSize: ThemeDimens.sizex16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: ThemeDimens.sizex08),
        TextFormField(
          controller: nameController,
          style: TextStyle(
              color: ThemeColors.labelTextColor, fontSize: ThemeDimens.sizex14),
          decoration: InputDecoration(
            hintText: ThemeConstants.name,
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
              return ThemeConstants.pleaseEnterYourName;
            }
            if (value.trim().isEmpty) {
              return ThemeConstants.pleaseEnterValidName;
            }
            return null;
          },
        ),
      ],
    );
  }
}
