import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flavor_hub/shared/themes/spaces.dart';
import 'package:flavor_hub/shared/widgets/buttons/primary_button.dart';
import 'package:flavor_hub/shared/widgets/inputs/custom_text_input.dart';
import 'package:flavor_hub/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                createAccount,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Colors.black87),
              ),
              smallVerticalSizedBox,
              Text(
                createAccountDescription,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              mediumVerticalSizedBox,
              CustomTextInput(labelText: userNameString),
              mediumVerticalSizedBox,
              CustomTextInput(labelText: emailString),
              mediumVerticalSizedBox,
              CustomTextInput(
                labelText: password,
                obscureText: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
              ),
              mediumVerticalSizedBox,
              CustomTextInput(
                labelText: confirmPassword,
                obscureText: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
              ),

              size100VerticalSizedBox,
              SizedBox(
                height: 48,
                width: double.infinity,
                child: PrimaryButton(
                  type: ButtonType.primary,
                  text: signUp,
                  onPressed: () {},
                ),
              ),

              largeVerticalSizedBox,

              _buildSignUpSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$alreayHaveAnAccount ",
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textMediumGray,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            signIn,
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
