import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

/// A customizable AppBar for the Recipe application.
///
/// This AppBar allows for setting a title, actions, a leading widget,
/// centering the title, background color, and elevation.
class RecipeBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;

  const RecipeBar({
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 4.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyles.header3),
      actions: actions,
      leading: leading,
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: elevation,
      iconTheme: Theme.of(
        context,
      ).appBarTheme.iconTheme?.copyWith(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
