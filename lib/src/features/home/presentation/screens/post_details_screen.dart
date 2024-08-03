import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme_colors.dart';
import '../../../../config/theme/theme_dimens.dart';
import '../../../../config/utils/constants.dart';
import '../../domain/entities/post.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: TextStyle(
            fontSize: ThemeDimens.sizex18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(),
          SizedBox(height: ThemeDimens.sizex08),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeDimens.sizex16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ThemeColors.whiteColor,
                      child: SvgPicture.asset(ThemeConstants.userAvatar),
                    ),
                    SizedBox(width: ThemeDimens.sizex08),
                    Text(
                      'Leanne Graham',
                      style: TextStyle(
                          color: ThemeColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ThemeDimens.sizex18),
                    ),
                  ],
                ),
                SizedBox(height: ThemeDimens.sizex12),
                Text(
                  'Title :',
                  style: TextStyle(
                      color: ThemeColors.blackColor.withOpacity(.6),
                      fontWeight: FontWeight.normal,
                      fontSize: ThemeDimens.sizex18),
                ),
                SizedBox(height: ThemeDimens.sizex06),
                Text(
                  post.title,
                  style: TextStyle(
                      color: ThemeColors.grayTextColor,
                      fontWeight: FontWeight.normal,
                      fontSize: ThemeDimens.sizex14),
                ),
                SizedBox(height: ThemeDimens.sizex08),
                const Divider(),
                SizedBox(height: ThemeDimens.sizex08),
                Text(
                  'body :',
                  style: TextStyle(
                      color: ThemeColors.blackColor.withOpacity(.6),
                      fontWeight: FontWeight.normal,
                      fontSize: ThemeDimens.sizex18),
                ),
                SizedBox(height: ThemeDimens.sizex06),
                Text(
                  post.body,
                  style: TextStyle(
                      color: ThemeColors.grayTextColor,
                      fontWeight: FontWeight.normal,
                      fontSize: ThemeDimens.sizex14),
                ),
                SizedBox(height: ThemeDimens.sizex08),
                const Divider(),
                SizedBox(height: ThemeDimens.sizex08),
                Row(
                  children: [
                    SvgPicture.asset(
                      ThemeConstants.postIcon,
                      height: 18,
                    ),
                    SizedBox(width: ThemeDimens.sizex12),
                    Text(
                      'POST ID : ${post.id}',
                      style: TextStyle(
                          color: ThemeColors.grayTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: ThemeDimens.sizex14),
                    ),
                    SizedBox(width: ThemeDimens.sizex18),
                    SvgPicture.asset(
                      ThemeConstants.userIcon,
                      height: 18,
                    ),
                    SizedBox(width: ThemeDimens.sizex12),
                    Text(
                      'USER ID : ${post.userId}',
                      style: TextStyle(
                          color: ThemeColors.grayTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: ThemeDimens.sizex14),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
