import 'package:flutter/material.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../screens/register_screen.dart';

/// Widget for displaying a login button with optional loading indicator.
class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: ThemeColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeDimens.sizex08),
            side: BorderSide(color: ThemeColors.mainColor),
          ),
          padding: EdgeInsets.symmetric(vertical: ThemeDimens.sizex16)),
      child: Text(
        ThemeConstants.signup,
        style: TextStyle(
            color: ThemeColors.mainColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
