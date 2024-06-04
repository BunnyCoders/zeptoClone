import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Widget _linksSection() {
    Widget link({
      required String iconPath,
      required String suffixIconPath,
      String? routePath,
      required String text,
    }) {
      return InkWell(
        onTap: () => Navigator.of(context).pushNamed(routePath!),
        child: Container(
          height: DSSizes.xl,
          padding: const EdgeInsets.all(DSSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    suffixIconPath,
                    colorFilter: const ColorFilter.mode(
                        DSColors.primary, BlendMode.srcIn),
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
                iconPath,
                colorFilter:
                    const ColorFilter.mode(DSColors.secondary, BlendMode.srcIn),
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
          suffixIconPath: 'assets/icons/bag.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.orders,
          text: 'Orders',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/support.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.customerCare,
          text: 'Customer Support & FAQ',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/address.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.savedAddresses,
          text: 'Addresses',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/return.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.refunds,
          text: 'Refunds',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/profile.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.profile,
          text: 'Profile',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/new.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          text: 'Suggest Products',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/info.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.generalInfo,
          text: 'General Info',
        ),
        const Divider(),
        link(
          suffixIconPath: 'assets/icons/notificationBell.svg',
          iconPath: 'assets/icons/forwardArrow.svg',
          routePath: RoutePaths.notification,
          text: 'Notifications',
        ),
        const Divider(),
        const SizedBox(
          height: DSSizes.xl + DSSizes.lg,
        ),
        SizedBox(
          height: DSSizes.lg + DSSizes.md,
          width: DSSizes.xxl,
          child: Button(
            onTap: () {},
            buttonType: ButtonTypes.outlined,
            text: 'Logout',
          ),
        ),
        const SizedBox(
          height: DSSizes.xs,
        ),
        Text(
          "App version 0.0.1 ",
          style: DSType.body1(
            context: context,
            textColor: DSColors.placeHolderDark,
          ),
        )
      ],
    );
  }

  Widget walletSection() {
    return Container(
      height: 105,
      width: 350,
      decoration: BoxDecoration(
          color: DSColors.walletColor,
          borderRadius: BorderRadius.circular(
            DSSizes.sm,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DSSizes.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: NetworkImage(
                        "https://cdn.zeptonow.com/web-static-assets-prod/artifacts/9.0.2/images/wallet-icon.png",
                      ),
                      height: DSSizes.lg,
                      width: DSSizes.lg,
                    ),
                    const SizedBox(
                      width: DSSizes.sm,
                    ),
                    Text(
                      "Zepto Cash",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/forwardArrow.svg",
                  colorFilter: const ColorFilter.mode(
                      DSColors.headingDark, BlendMode.srcIn),
                  height: DSSizes.sm,
                  width: DSSizes.sm,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(DSSizes.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Up Your Wallet",
                  style: DSType.subtitle1(
                    context: context,
                    textColor: DSColors.placeHolderDark,
                  ),
                ),
                Container(
                  height: DSSizes.md + DSSizes.sm,
                  width: DSSizes.xl + DSSizes.sm,
                  decoration: BoxDecoration(
                      color: DSColors.plasma,
                      borderRadius: BorderRadius.circular(
                        DSSizes.xs,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "Unavailable",
                      style: DSType.smallBold(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.lg,
        ),
        walletSection(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _linksSection(),
        const SizedBox(
          height: DSSizes.sm,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context: context, title: 'Settings', showBack: true),
      child: _buildUI(),
    );
  }
}
