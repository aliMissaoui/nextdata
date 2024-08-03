// posts_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';
import '../../../../config/utils/constants.dart';
import '../../domain/entities/post.dart';
import '../bloc/posts_bloc.dart';
import '../bloc/posts_event.dart';
import '../bloc/posts_state.dart';
import '../widgets/no_posts.dart';
import 'post_details_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dispatch the FetchPosts event when the screen is built
    context.read<PostsBloc>().add(FetchPostsEvent());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            if (state.posts.isEmpty) {
              return const NoPostsAvailable(
                message: ThemeConstants.noPostsAvailable,
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.only(top: ThemeDimens.sizex04),
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return PostCard(post: post);
                },
              );
            }
          } else if (state is PostsError) {
            return NoPostsAvailable(
              message: 'Error: ${state.message}',
            );
          } else {
            return const NoPostsAvailable(
              message: ThemeConstants.noPostsAvailable,
            );
          }
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ThemeDimens.sizex08),
      elevation: 20.0,
      shadowColor: ThemeColors.blackColor.withOpacity(.2),
      color: ThemeColors.whiteColor,
      surfaceTintColor: ThemeColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(ThemeDimens.sizex16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            SizedBox(height: ThemeDimens.sizex08),
            Text(
              post.title,
              style: TextStyle(
                  color: ThemeColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ThemeDimens.sizex14),
            ),
            SizedBox(height: ThemeDimens.sizex08),
            Text(
              post.body,
              style: TextStyle(
                  color: ThemeColors.blackColor.withOpacity(.7),
                  fontWeight: FontWeight.normal,
                  fontSize: ThemeDimens.sizex14),
            ),
            SizedBox(height: ThemeDimens.sizex12),
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
              ],
            ),
            SizedBox(height: ThemeDimens.sizex12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailsPage(post: post),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: ThemeColors.lightMainColor.withOpacity(.2),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ThemeDimens.sizex24 * 2),
                    side: BorderSide(
                        color: ThemeColors.lightMainColor.withOpacity(.2)),
                  ),
                ),
                child: Text(
                  'Detail',
                  style: TextStyle(
                      color: ThemeColors.mainColor,
                      fontWeight: FontWeight.w500,
                      fontSize: ThemeDimens.sizex14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
