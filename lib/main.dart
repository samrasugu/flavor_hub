import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor_hub/screens/login_screen.dart';
import 'package:flavor_hub/screens/main_navigation_screen.dart';
import 'package:flavor_hub/screens/recipe_details_screen.dart';
import 'package:flavor_hub/screens/signup_screen.dart';
import 'package:flavor_hub/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // Ensure all bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase with secure options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'] ?? '';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('fr', 'FR'),
            Locale('ja', 'JP'),
          ],
          path: 'assets/translations', //
          fallbackLocale: Locale('en'),
          child: MyApp(),
        ),
      ),
    ),
  );
  // TODO: Remove this line after sending the first sample event to sentry.
  await Sentry.captureException(Exception('This is a sample exception.'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // providers here
      ],
      child: MaterialApp(
        title: dotenv.env['APP_NAME'] ?? 'Flavor Hub',
        theme: AppTheme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/main',
        routes: {
          '/main': (context) => const MainNavigationScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => SignupScreen(),
          '/recipeDetails': (context) => RecipeDetailsScreen(),
          '/home': (context) => MainNavigationScreen(),
        },
      ),
    );
  }
}
