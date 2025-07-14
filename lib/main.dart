import 'package:easy_localization/easy_localization.dart';
import 'package:flavor_hub/screens/home.dart';
import 'package:flavor_hub/screens/login.dart';
import 'package:flavor_hub/screens/request_recipe.dart';
import 'package:flavor_hub/screens/signup.dart';
import 'package:flavor_hub/utils/server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Ensure all bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");
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
        title: tr('app_description'),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/home',
        routes: {
          '/request': (context) => RecipeRequestScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
