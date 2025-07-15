import 'package:easy_localization/easy_localization.dart';
import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/themes/app_theme.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HeroBannerCard extends StatelessWidget {
  const HeroBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: AppTheme.lightTheme.colorScheme.outline.withValues(
              alpha: 0.2,
            ),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr(learnHowTobecomeChef),
                    style: AppTextStyles.header3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  PrimaryButton(text: tr(readMore), type: ButtonType.secondary),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/hero_banner_image.png',
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
