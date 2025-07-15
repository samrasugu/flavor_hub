import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.type,
  });

  final void Function()? onPressed;
  final String text;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: type == ButtonType.primary
          ? AppColors.primaryOrange
          : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      elevation: type == ButtonType.primary ? 2 : 0,
      child: Text(
        text,
        style: AppTextStyles.buttonText.copyWith(
          color: type == ButtonType.primary
              ? Colors.white
              : AppColors.primaryOrange,
        ),
      ),
    );
  }
}
