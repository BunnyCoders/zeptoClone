import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxInput extends StatelessWidget {
  final String label;
  final bool? value;
  final Function(bool?) onChanged;

  const CheckBoxInput({
    Key? key,
    this.label = '',
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            checkColor: DSColors.headingDark,
            fillColor: MaterialStateProperty.all<Color>(Colors.transparent),
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DSSizes.xs),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(
                width: 1,
                color: DSColors.borderDark,
              ),
            ),
            value: value,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: DSSizes.xs),
          child: label == ''
              ? null
              : Row(
                  children: [
                    SizedBox(width: DSSizes.md.w),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: DSType.body2(
                        context: context,
                        textColor: DSColors.bodyDark,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
