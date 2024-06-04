import 'package:flutter/material.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushReplacementNamed(
        RoutePaths.login,
      );
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.clamp,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                DSColors.primary,
                Color(0xff281537),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Zepto",
                style: DSType.h2(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
              ),
              Text(
                "10 min Grocery Delivery",
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
              ),
            ],
          )),
    );
  }
}
