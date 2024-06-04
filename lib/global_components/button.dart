import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/core/design_system.dart';

enum ButtonTypes { filled, outlined, text }

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.buttonType = ButtonTypes.outlined,
    this.isDisabled = false,
    this.isRounded = false,
    this.isSmall = false,
    required this.onTap,
    required this.text,
    this.textColor = DSColors.linkDark,
  });

  final ButtonTypes buttonType;
  final bool isDisabled;
  final bool isRounded;
  final bool isSmall;
  final Function onTap;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSmall ? 28.h : 48.h,
      child: () {
        switch (buttonType) {
          case ButtonTypes.filled:
            return TextButton(
              style: ButtonStyle(
                backgroundColor: isDisabled
                    ? MaterialStateProperty.all<Color>(DSColors.backgroundGrey)
                    : MaterialStateProperty.all<Color>(DSColors.secondary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  isRounded
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DSSizes.lg),
                        )
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DSSizes.sm),
                        ),
                ),
              ),
              onPressed: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: isSmall
                        ? DSType.buttonSmall(
                            context: context,
                            textColor: isDisabled
                                ? DSColors.placeHolderDark
                                : DSColors.headingLight,
                          )
                        : DSType.button(
                            context: context,
                            textColor: isDisabled
                                ? DSColors.secondary
                                : DSColors.headingLight,
                          ),
                  )
                ],
              ),
            );
          case ButtonTypes.outlined:
            return OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    color: DSColors.secondary,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        DSSizes.sm,
                      ),
                    ),
                  ),
                ),
              ),
              onPressed: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: isSmall
                        ? DSType.buttonSmall(
                            context: context,
                            textColor: DSColors.secondary,
                          )
                        : DSType.button(
                            context: context,
                            textColor: DSColors.secondary,
                          ),
                  )
                ],
              ),
            );
          case ButtonTypes.text:
            return TextButton(
              onPressed: () => onTap(),
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: const Size(4, 4),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: isSmall
                        ? DSType.buttonSmall(
                            context: context,
                            textColor: textColor,
                          )
                        : DSType.button(
                            context: context,
                            textColor: textColor,
                          ),
                  )
                ],
              ),
            );

          default:
            Container(
              color: DSColors.alert,
              height: 100,
              width: 100,
            );
        }
      }(),
    );
  }
}
