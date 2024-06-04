import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zepto_clone/core/design_system.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      // systemOverlayStyle:
      //     const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 275.0,

      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          imagePath.toString(),
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(24.0),
        child: Container(
          height: DSSizes.lg,
          // alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: DSColors.backgroundLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          // child: Container(
          //   width: 40.0,
          //   height: 5.0,
          //   decoration: BoxDecoration(
          //     color: DSColors.backgroundGrey,
          //     borderRadius: BorderRadius.circular(100.0),
          //   ),
          // ),
        ),
      ),
    );
  }
}
