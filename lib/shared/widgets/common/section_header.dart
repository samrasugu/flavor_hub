import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onMorePressed});

  final String title;
  final VoidCallback? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(title, style: AppTextStyles.header3),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.primaryOrange,
          ),
          onPressed: onMorePressed,
        ),
      ],
    );
  }
}
