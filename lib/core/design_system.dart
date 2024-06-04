import 'package:flutter/material.dart';
import 'package:zepto_clone/core/helpers.dart';

class DSColors {
  // primary colors
  static const Color primaryG1 = Color.fromRGBO(132, 17, 200, 1);
  static const Color primaryG2 = Color.fromRGBO(76, 2, 147, 1);
  static const Color primary = Color.fromRGBO(124, 10, 177, 1);
  static const Color darkMatter = Color.fromRGBO(60, 0, 140, 1);
  static const Color walletColor = Color.fromRGBO(217, 244, 229, 1);
  static const Color plasma = Color.fromRGBO(181, 196, 191, 1);
  static const Color plasma1 = Color.fromRGBO(244, 235, 253, 1);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color.fromRGBO(60, 0, 140, 1),
      Color.fromRGBO(255, 50, 105, 1),
    ],
    tileMode: TileMode.repeated,
  );

  // accent colors
  static const Color secondary = Color.fromRGBO(255, 50, 105, 1);
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xff003482),
      Color(0xff328EDC),
    ],
    tileMode: TileMode.repeated,
  );

  // default system colors
  static const Color error = Color(0xffff0000);
  static const Color alert = Color(0xfffaff00);
  static const Color success = Color(0xff25B900);

  // typography colors
  static const Color headingLight = Color(0xffffffff);
  static const Color headingDark = Color(0xff000000);
  static const Color bodyLight = Color(0xffffffff);
  static const Color bodyDark = Color(0xff373737);
  static const Color placeHolderLight = Color(0xffd2d2d2);
  static const Color placeHolderDark = Color(0xff909090);
  static const Color linkLight = Color(0xfff4f4f4);
  static const Color linkDark = Color(0xff118ACE);
  static const Color iconDark = Color(0xff6B6464);

  // element backgrounds
  static const Color backgroundLight = Color(0xffFFFFFF);
  static const Color backgroundDark = Color(0xff000000);
  static const Color backgroundGrey = Color(0xffF4F4F4);
  static const Color backgroundInputField = Color(0xffE7E7E7);
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xffEFEFEF),
      Color(0xffE2E2E2),
    ],
    tileMode: TileMode.repeated,
  );

  // border colors
  static const Color borderLight = Color(0xffe7e7e7);
  static const Color borderDark = Color(0xffc4c4c4);
}

class DSType {
  static const String _coreSansG = 'Core Sans G';

  static TextStyle h1({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      decorationColor: decorationColor,
      color: textColor,
      fontFamily: _coreSansG,
      fontWeight: FontWeight.w300,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 96),
      height: 1,
      letterSpacing: -1.5,
    );
  }

  static TextStyle h2({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      decorationColor: decorationColor,
      color: textColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 60),
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: -0.5,
    );
  }

  static TextStyle h3({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 48),
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    );
  }

  static TextStyle h4({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontWeight: FontWeight.w400,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 34),
      height: 1.3,
      letterSpacing: 0.25,
    );
  }

  static TextStyle h5({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 24),
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0,
    );
  }

  static TextStyle h6({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 20),
      fontWeight: FontWeight.w600,
      height: 1.3,
      letterSpacing: 0.15,
    );
  }

  static TextStyle subtitle1({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 14),
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: 0.15,
    );
  }

  static TextStyle subtitle2({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 12),
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.1,
    );
  }

  static TextStyle body1({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 14),
      fontWeight: FontWeight.w300,
      height: 1.5,
      letterSpacing: 0.5,
    );
  }

  static TextStyle body2({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 12),
      fontWeight: FontWeight.w400,
      height: 1.2,
      letterSpacing: 0.25,
    );
  }

  static TextStyle button({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 14),
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 1.0,
    );
  }

  static TextStyle navigation({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 12),
      fontWeight: FontWeight.w400,
      height: 1.7,
      letterSpacing: 0.25,
    );
  }

  static TextStyle buttonSmall({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 12),
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 1.25,
    );
  }

  static TextStyle time({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 10),
      fontWeight: FontWeight.w400,
      height: 1.7,
      letterSpacing: 1.5,
    );
  }

  static TextStyle small({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 10),
      fontWeight: FontWeight.w300,
      height: 1.5,
      letterSpacing: 0.4,
    );
  }

  static TextStyle smallBold({
    required BuildContext context,
    Color textColor = DSColors.primary,
    bool isLineThrough = false,
    Color decorationColor = DSColors.primary,
  }) {
    return TextStyle(
      decoration:
          isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor,
      decorationColor: decorationColor,
      fontFamily: _coreSansG,
      fontSize: const AdaptiveTextSize().getAdaptiveTextSize(context, 10),
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: 0.25,
    );
  }
}

class DSSizes {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 32;
  static const double xl = 64;
  static const double xxl = 128;
  static const double xxxl = 256;
}

class DSShadows {
  static const buttonCard = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 1,
      offset: Offset(0, 0.1),
    ),
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, 2),
    )
  ];

  static const buttonCardHover = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4,
      offset: Offset(0, 4),
    )
  ];

  static const navigationMenu = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 0),
    ),
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 0),
    )
  ];

  static const modal = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(7, 14),
    )
  ];

  static const bottomSheet = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(-2, 4),
    )
  ];
}
