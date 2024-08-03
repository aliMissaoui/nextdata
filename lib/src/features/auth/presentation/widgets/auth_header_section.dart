import 'package:flutter/material.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

/// Header widget for displaying text.
class AuthHeader extends StatelessWidget {
  final String headerText;
  final String descriptionText;

  const AuthHeader(
      {super.key, required this.headerText, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headerText,
          style: TextStyle(
            color: ThemeColors.textMainColor,
            fontSize: ThemeDimens.sizex20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ThemeDimens.sizex10),
        Text(
          descriptionText,
          style: TextStyle(
            color: ThemeColors.grayTextColor,
            fontSize: ThemeDimens.sizex14,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
