import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_event.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ThemeConstants.nextdataLogo,
                      semanticsLabel: ThemeConstants.nextdataLogoLabel,
                    ),
                    SizedBox(
                      height: ThemeDimens.sizex08,
                    ),
                    const Text(
                      ThemeConstants.wlcToNextData,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Categories'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColors.mainColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(ThemeDimens.sizex24 * 2),
                ),
                child: IntrinsicWidth(
                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(Icons.arrow_back),
                        SizedBox(
                          width: ThemeDimens.sizex08,
                        ),
                        Text(
                          'Close',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ThemeDimens.sizex14),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    onTap: () {
                      context.read<HomeBloc>().add(CloseDrawerEvent());
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
