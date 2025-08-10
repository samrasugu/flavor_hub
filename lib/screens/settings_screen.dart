import 'package:flavor_hub/components/app_bar.dart';
import 'package:flavor_hub/components/settings_card.dart';
import 'package:flavor_hub/providers/theme_provider.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ThemeProvider>();
    return Scaffold(
      appBar: RecipeBar(title: settings),
      body: ListView(
        children: [
          SettingsCard(
            icon: Icons.account_circle,
            title: 'Profile',
            onTap: () {
              // Handle profile tap
            },
          ),
          SettingsCard(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Handle notifications tap
            },
          ),
          SettingsCard(
            icon: Icons.lock,
            title: 'Privacy',
            onTap: () {
              // Handle privacy tap
            },
          ),

          SettingsCard(
            icon: Icons.language,
            title: 'Language',
            customTrailingWidget: Text(
              'English (US)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              // Handle language tap
            },
          ),

          SettingsCard(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            customTrailingWidget: Switch(
              value: provider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                provider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/setTheme');
            },
          ),

          SettingsCard(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    );
  }
}
