// custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme_colors.dart';
import '../../../../config/theme/theme_dimens.dart';
import '../../../../config/utils/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedLabelStyle: TextStyle(
        fontSize: ThemeDimens.sizex12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: ThemeDimens.sizex12,
        fontWeight: FontWeight.w500,
      ),
      selectedItemColor: ThemeColors.buttomMenuTextColor,
      unselectedItemColor: ThemeColors.buttomMenuTextColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ThemeConstants.homeIcons,
          ),
          activeIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex08,
              vertical: ThemeDimens.sizex02,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColors.whiteColor,
                  ThemeColors.whiteColor.withOpacity(.1),
                  ThemeColors.mainColor.withOpacity(.2)
                ],
                stops: const [0.0, 0.25, 0.75],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(ThemeDimens.sizex24),
            ),
            child: SvgPicture.asset(
              ThemeConstants.homeIcons,
              colorFilter:
                  ColorFilter.mode(ThemeColors.mainColor, BlendMode.srcIn),
            ),
          ),
          label: ThemeConstants.home,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ThemeConstants.postsIcons,
            colorFilter: ColorFilter.mode(
                ThemeColors.unactiveIconColor, BlendMode.srcIn),
          ),
          activeIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex08,
              vertical: ThemeDimens.sizex02,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColors.whiteColor,
                  ThemeColors.whiteColor.withOpacity(.1),
                  ThemeColors.mainColor.withOpacity(.2)
                ],
                stops: const [0.0, 0.25, 0.75],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(ThemeDimens.sizex24),
            ),
            child: SvgPicture.asset(
              ThemeConstants.postsIcons,
            ),
          ),
          label: ThemeConstants.posts,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ThemeConstants.exploreIcons,
          ),
          activeIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex08,
              vertical: ThemeDimens.sizex02,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColors.whiteColor,
                  ThemeColors.whiteColor.withOpacity(.1),
                  ThemeColors.mainColor.withOpacity(.2)
                ],
                stops: const [0.0, 0.25, 0.75],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(ThemeDimens.sizex24),
            ),
            child: SvgPicture.asset(
              ThemeConstants.exploreIcons,
              colorFilter:
                  ColorFilter.mode(ThemeColors.mainColor, BlendMode.srcIn),
            ),
          ),
          label: ThemeConstants.explore,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ThemeConstants.accountIcons,
          ),
          activeIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex08,
              vertical: ThemeDimens.sizex02,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColors.whiteColor,
                  ThemeColors.whiteColor.withOpacity(.1),
                  ThemeColors.mainColor.withOpacity(.2)
                ],
                stops: const [0.0, 0.25, 0.75],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(ThemeDimens.sizex24),
            ),
            child: SvgPicture.asset(
              ThemeConstants.accountIcons,
              colorFilter:
                  ColorFilter.mode(ThemeColors.mainColor, BlendMode.srcIn),
            ),
          ),
          label: ThemeConstants.account,
        ),
      ],
    );
  }
}
