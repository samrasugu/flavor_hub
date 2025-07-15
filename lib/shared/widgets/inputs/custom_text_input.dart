import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.borderColor,
    this.focusedBorderColor,
    this.inputFormatters,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    bool? enabled,
    this.customFillColor,
    this.validator,
    this.keyboardType,
    this.formFieldKey,
    bool? obscureText,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSuffixIconPressed,
    this.autovalidateMode,
  }) : enabled = enabled ?? true,
       obscureText = obscureText ?? false;

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? enabled;
  final Color? customFillColor;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Key? formFieldKey;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onSuffixIconPressed;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      keyboardType: keyboardType,
      key: formFieldKey,
      onTap: () {
        onTap?.call();
      },
      onFieldSubmitted: (String value) {
        onFieldSubmitted?.call(value);
      },
      onChanged: (String value) {
        onChanged?.call(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.transparent,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  onSuffixIconPressed?.call();
                },
              )
            : null,
        contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        hintStyle: const TextStyle(fontSize: 16),
        labelText: labelText,
        labelStyle: AppTextStyles.caption.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
    );
  }
}
