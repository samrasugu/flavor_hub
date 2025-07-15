import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';
import 'package:flavor_hub/shared/widgets/inputs/custom_text_input.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                helloThere,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Colors.black87),
              ),
              smallVerticalSizedBox,
              Text(
                signInDescription,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              mediumVerticalSizedBox,
              CustomTextInput(labelText: userNameEmail),
              mediumVerticalSizedBox,
              CustomTextInput(
                labelText: password,
                obscureText: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    // Handle visibility toggle
                  },
                ),
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //TODO:: Handle forgot password
                  },
                  child: Text(
                    forgotPassword,
                    style: AppTextStyles.caption.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              largeVerticalSizedBox,
              SizedBox(
                height: 48,
                width: double.infinity,
                child: PrimaryButton(
                  type: ButtonType.primary,
                  text: signIn,
                  onPressed: () {},
                ),
              ),

              mediumVerticalSizedBox,

              _buildOrContinueWithSection(),
              largeVerticalSizedBox,

              _buildSignUpSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrContinueWithSection() {
    return Column(
      children: [
        // Divider with "Or continue with" text
        Row(
          children: [
            const Expanded(
              child: Divider(color: AppColors.borderLightGray, thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Or continue with',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textMediumGray,
                ),
              ),
            ),
            const Expanded(
              child: Divider(color: AppColors.borderLightGray, thickness: 1),
            ),
          ],
        ),
        mediumVerticalSizedBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialLoginButton(
              icon: FontAwesomeIcons.google,
              onPressed: () {
                // TODO: Handle Google login
              },
            ),
            _buildSocialLoginButton(
              icon: Icons.apple,
              onPressed: () {
                // TODO: Handle Apple login
              },
            ),
            _buildSocialLoginButton(
              icon: Icons.facebook,
              onPressed: () {
                // TODO: Handle Facebook login
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderLightGray),
          borderRadius: BorderRadius.circular(24),
          color: AppColors.surface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon, size: 24, color: AppColors.textCharcoal)],
        ),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$dontHaveAnAccount ",
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textMediumGray,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/register');
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            signUp,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
