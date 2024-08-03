import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';
import 'package:nextdata/src/features/auth/presentation/screens/login_screen.dart';

import '../bloc/opening_screen_bloc.dart';
import '../bloc/opening_screen_event.dart';
import '../bloc/opening_screen_state.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OpeningScreenBloc()..add(StartOpeningScreenEvent()),
      child: BlocListener<OpeningScreenBloc, OpeningScreenState>(
        listener: (context, state) {
          if (state is OpeningScreenNavigate) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [ThemeColors.darkMainColor, ThemeColors.mainColor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: ThemeDimens.sizex24),
                  child: SvgPicture.asset(
                    ThemeConstants.nextdataWhiteLogo,
                    semanticsLabel: ThemeConstants.nextdataLogoLabel,
                  ),
                ),
                SizedBox(height: ThemeDimens.sizex24 * 2),
                SpinKitRing(
                  color: ThemeColors.whiteColor,
                  lineWidth: 4.0,
                  size: ThemeDimens.sizex24 * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
