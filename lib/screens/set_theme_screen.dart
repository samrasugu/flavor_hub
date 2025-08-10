import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetThemeScreen extends StatelessWidget {
  const SetThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ThemeProvider>();
    return Scaffold(
      appBar: RecipeBar(title: 'Set Theme'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  provider.setThemeMode(ThemeMode.light);
                },
                child: const Text('Light Theme'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  provider.setThemeMode(ThemeMode.dark);
                },
                child: const Text('Dark Theme'),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  provider.setThemeMode(ThemeMode.system);
                },
                child: const Text('System Default'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
