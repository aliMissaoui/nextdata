import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme_colors.dart';
import '../../../../config/theme/theme_dimens.dart';
import '../../../../config/utils/constants.dart';

class NoPostsAvailable extends StatelessWidget {
  final String message;
  const NoPostsAvailable({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.whiteColor,
      surfaceTintColor: ThemeColors.whiteColor,
      margin: EdgeInsets.all(ThemeDimens.sizex24),
      child: Container(
        padding: EdgeInsets.all(ThemeDimens.sizex12),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .3,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(ThemeConstants.serverErrorIcon),
            SizedBox(
              height: ThemeDimens.sizex12,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: ThemeDimens.sizex14,
                fontWeight: FontWeight.bold,
                color: ThemeColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
