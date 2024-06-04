import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum KeyboardType { number, text, textArea }

class InputField extends StatelessWidget {
  final bool autoValidateMode;
  final bool autoFocus;
  final TextEditingController controller;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final bool isPassword;
  final bool isKeyboardTypeNumber;
  final bool isTextCenter;
  final bool isTextArea;
  final String? Function(String)? onChanged;
  final VoidCallback? onTapSuffix;
  final String? Function(String)? onSubmitted;
  final String placeholder;
  final String suffixIconPath;
  final String suffixText;
  final String prefixText;
  final String? Function(String?) validator;

  const InputField({
    super.key,
    this.autoValidateMode = true,
    this.autoFocus = false,
    required this.controller,
    this.enabled = true,
    required this.inputFormatters,
    this.isPassword = false,
    this.isKeyboardTypeNumber = false,
    this.isTextCenter = false,
    this.isTextArea = false,
    this.onTapSuffix,
    this.placeholder = '',
    required this.validator,
    this.onChanged,
    this.onSubmitted,
    this.suffixIconPath = '',
    this.suffixText = '',
    this.prefixText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      autofocus: autoFocus,
      controller: controller,
      cursorColor: DSColors.headingDark,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              DSSizes.lg,
            ),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              DSSizes.lg,
            ),
          ),
          borderSide: BorderSide(
            width: 0,
            color: DSColors.borderLight,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              DSSizes.lg,
            ),
          ),
          borderSide: BorderSide(
            width: 0,
            color: DSColors.borderLight,
          ),
        ),
        filled: true,
        fillColor: DSColors.backgroundGrey,
        hintStyle: DSType.body2(
          context: context,
          textColor: DSColors.placeHolderDark,
        ),
        isDense: true,
        labelStyle: DSType.body2(
          context: context,
          textColor: DSColors.placeHolderDark,
        ),
        hintText: placeholder,
        suffixText: suffixText,
        prefixText: prefixText,
        prefixStyle: DSType.body2(
          context: context,
          textColor: DSColors.headingDark,
        ),
        suffixIcon: suffixIconPath != ''
            ? IconButton(
                onPressed: () => onTapSuffix!(),
                icon: SvgPicture.asset(
                  suffixIconPath,
                  colorFilter: const ColorFilter.mode(
                    DSColors.headingDark,
                    BlendMode.srcIn,
                  ),
                  height: 16.h,
                  width: 16.h,
                ),
              )
            : const SizedBox(),
      ),
      enabled: enabled,
      keyboardType: () {
        if (isKeyboardTypeNumber) {
          return TextInputType.number;
        }

        if (isTextArea) {
          return TextInputType.multiline;
        }

        return TextInputType.text;
      }(),
      minLines: isTextArea ? 6 : null,
      maxLines: isTextArea ? null : 1,
      obscureText: isPassword,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: DSType.body2(
        context: context,
        textColor: DSColors.headingDark,
      ),
      textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
      validator: validator,
    );
  }
}
