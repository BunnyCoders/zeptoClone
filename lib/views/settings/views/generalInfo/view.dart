import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class GeneralInfoView extends StatefulWidget {
  const GeneralInfoView({super.key});

  @override
  State<GeneralInfoView> createState() => _GeneralInfoViewState();
}

class _GeneralInfoViewState extends State<GeneralInfoView> {
  Widget _linksSection() {
    Widget link({
      required String iconPath,
      required String routePath,
      required String text,
    }) {
      return InkWell(
        // onTap: () => Navigator.of(context).pushNamed(routePath),
        child: Container(
          height: DSSizes.xl,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                DSSizes.xs,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                )
              ]),
          padding: const EdgeInsets.all(DSSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    colorFilter: const ColorFilter.mode(
                        DSColors.headingDark, BlendMode.srcIn),
                    height: DSSizes.md + DSSizes.sm,
                    width: DSSizes.md + DSSizes.sm,
                  ),
                  const SizedBox(
                    width: DSSizes.md,
                  ),
                  Text(
                    text,
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/forwardArrow.svg",
                colorFilter: const ColorFilter.mode(
                    DSColors.headingDark, BlendMode.srcIn),
                height: DSSizes.sm + DSSizes.xs,
                width: DSSizes.sm + DSSizes.xs,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        link(
          iconPath: 'assets/icons/t&c.svg',
          routePath: RoutePaths.orders,
          text: 'Terms & Conditions',
        ),
        const SizedBox(height: DSSizes.sm,),
        link(
          iconPath: 'assets/icons/lock.svg',
          routePath: RoutePaths.customerCare,
          text: 'Privacy Policy',
        ),
        const SizedBox(height: DSSizes.sm,),
        link(
          iconPath: 'assets/icons/source-code.svg',
          routePath: RoutePaths.savedAddresses,
          text: 'Open Source Licenses',
        ),
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        _linksSection()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Policies',
        showBack: true,
        // isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
