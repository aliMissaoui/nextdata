import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nextdata/src/config/utils/constants.dart';
import 'src/app.dart';
import 'src/config/utils/conditions.dart';
import 'src/injection_container.dart' as di;

/// The entry point of the nextdata application.
///
/// The `main` function is the first function called when the app is started.
/// It initializes the dependency injection container and runs the application.
void main() async {
  // Load .env file [Env variables]
  await dotenv.load(fileName: ThemeConstants.envFileName);

  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    ),
  );

  // Initialize the dependency injection container.
  di.init();

  // Lock the app in portrait mode.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Hide the Status Bar.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  // Determine the initial route based on token validation.
  final initialRoute = await ConditionsHelper().determineInitialRoute();

  // Run the application with the determined initial route.
  runApp(App(initialRoute: initialRoute));
}
