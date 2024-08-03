import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_event.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import '../bloc/posts_bloc.dart';
import '../bloc/posts_event.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height,
        right: ThemeDimens.sizex12,
        left: ThemeDimens.sizex12,
        bottom: ThemeDimens.sizex12,
      ),
      color: ThemeColors.whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  ThemeConstants.appIconMenu,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(OpenDrawerEvent());
                },
              ),
              SizedBox(
                width: ThemeDimens.sizex08,
              ),
              Text(
                'Browse posts',
                style: TextStyle(
                  fontSize: ThemeDimens.sizex18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex12,
              vertical: ThemeDimens.sizex10,
            ),
            child: Container(
              height: ThemeDimens.sizex24 * 2,
              decoration: BoxDecoration(
                color: ThemeColors.searchBgColor,
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: TextField(
                style: TextStyle(
                  color: ThemeColors.grayTextColor,
                  fontSize: ThemeDimens.sizex14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ThemeConstants.search,
                  hintStyle: TextStyle(
                    color: ThemeColors.grayTextColor,
                    fontSize: ThemeDimens.sizex14,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ThemeDimens.sizex14,
                    ),
                    child: SvgPicture.asset(
                      ThemeConstants.searchIcon,
                      colorFilter: ColorFilter.mode(
                        ThemeColors.searchIconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                onChanged: (query) {
                  context.read<PostsBloc>().add(SearchPostsEvent(query));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
