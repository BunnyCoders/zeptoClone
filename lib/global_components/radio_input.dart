import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';

class RadioInput extends StatelessWidget {
  final String label;
  final void Function(String?) onChanged;
  final String selectedOption;

  const RadioInput({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: DSColors.headingDark,
          groupValue: selectedOption,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: onChanged,
          toggleable: true,
          value: label,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        const SizedBox(width: DSSizes.sm),
        Text(
          label,
          style: DSType.body2(
            context: context,
            textColor: DSColors.headingDark,
          ),
        ),
      ],
    );
  }
}
