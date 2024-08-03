import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nextdata/src/config/theme/theme_colors.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'package:nextdata/src/features/auth/presentation/screens/opening_screen.dart';
import 'package:nextdata/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nextdata/src/features/home/presentation/bloc/posts_bloc.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'package:nextdata/src/injection_container.dart' as di;

import 'features/home/presentation/screens/home_screen.dart';

/// The main entry point for the application.
///
/// This widget initializes the BLoC provider for authentication and sets up the
/// routes for the application.
class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => di.sl<HomeBloc>(),
        ),
        BlocProvider<PostsBloc>(
          create: (context) => di.sl<PostsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: ThemeConstants.appNameMAJ,
        initialRoute: initialRoute,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorSchemeSeed: ThemeColors.mainColor,
        ),
        routes: {
          /// Defines the initial route as the [OpeningScreen].
          '/opening': (context) => const OpeningScreen(),

          /// Defines the root route as the [LoginScreen].
          '/': (context) => LoginScreen(),

          /// Defines the home route.
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
