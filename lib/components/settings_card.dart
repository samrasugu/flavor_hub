import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.customTrailingWidget,
  });

  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final Widget? customTrailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon ?? Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
          smallHorizontalSizedBox,
          Text(
            title ?? 'Settings',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          customTrailingWidget ?? const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
