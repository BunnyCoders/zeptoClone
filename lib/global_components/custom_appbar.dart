import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: non_constant_identifier_names
PreferredSize CustomAppBar({
  required BuildContext context,
  bool isSmallText = true,
  required String title,
  bool showBack = false,
  Widget? rightAction,
}) {
  void onTapBack() {
    Navigator.pop(context);
  }

  return PreferredSize(
    preferredSize: Size.fromHeight(130.h),
    child: Container(
      decoration: const BoxDecoration(
        color: DSColors.headingLight,
        boxShadow: DSShadows.bottomSheet,
      ),
      padding: EdgeInsets.only(
        bottom: DSSizes.md.h,
        top: 64.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: showBack,
            child: Row(
              children: [
                const SizedBox(width: DSSizes.md),
                InkWell(
                  onTap: onTapBack,
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: DSSizes.sm,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/backArrow.svg',
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      height: isSmallText ? 18.h : 20.h,
                      width: isSmallText ? 18.w : 20.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: isSmallText ? DSSizes.xxl : DSSizes.lg + DSSizes.sm),
          Text(
            title,
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingDark,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const Expanded(child: SizedBox()),
          rightAction ?? const SizedBox(),
          const SizedBox(width: DSSizes.md),
        ],
      ),
    ),
  );
}
