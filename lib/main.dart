import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor_hub/screens/login_screen.dart';
import 'package:flavor_hub/screens/main_navigation_screen.dart';
import 'package:flavor_hub/screens/recipe_details_screen.dart';
import 'package:flavor_hub/screens/request_recipe.dart';
import 'package:flavor_hub/screens/signup.dart';
import 'package:flavor_hub/shared/themes/app_theme.dart';
import 'package:flavor_hub/utils/server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensure all bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase with secure options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr', 'FR'),
        Locale('ja', 'JP'),
      ],
      path: 'assets/translations', //
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => ApiService())],
      child: MaterialApp(
        title: dotenv.env['APP_NAME'] ?? 'Flavor Hub',
        theme: AppTheme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/main',
        routes: {
          '/main': (context) => const MainNavigationScreen(),
          '/request': (context) => RecipeRequestScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/recipeDetails': (context) => RecipeDetailsScreen(),
          '/home': (context) => MainNavigationScreen(),
        },
      ),
    );
  }
}
