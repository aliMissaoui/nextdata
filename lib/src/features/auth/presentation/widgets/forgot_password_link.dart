import 'package:flutter/material.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../../../../config/theme/theme_colors.dart';

/// Widget for displaying a "Forgot Password" link.
class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Text(
        ThemeConstants.forgotPassword,
        style: TextStyle(
            color: ThemeColors.mainColor,
            fontSize: ThemeDimens.sizex12,
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.end,
      ),
    );
  }
}
