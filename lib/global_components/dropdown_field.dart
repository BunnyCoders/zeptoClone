import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String?) onChanged;
  final String label;
  final String selectedOption;
  final List<String> options;

  const DropdownField({
    Key? key,
    required this.controller,
    this.label = '',
    required this.onChanged,
    required this.selectedOption,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: label == ''
              ? null
              : Column(
                  children: [
                    Text(
                      label,
                      style: DSType.body2(
                        context: context,
                        textColor: DSColors.bodyDark,
                      ),
                    ),
                    const SizedBox(height: DSSizes.sm),
                  ],
                ),
        ),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 14.h,
                  right: DSSizes.md.w,
                  // bottom: 15,
                  left: DSSizes.md.w,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      DSSizes.xs,
                    ),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: DSColors.borderLight,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      DSSizes.xs,
                    ),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: DSColors.error,
                  ),
                ),
                filled: true,
                fillColor: DSColors.backgroundGrey,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedOption,
                  isDense: true,
                  // isExpanded: true,
                  onChanged: onChanged,
                  items: options.map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: DSType.body1(
                            context: context,
                            textColor: DSColors.bodyDark,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
