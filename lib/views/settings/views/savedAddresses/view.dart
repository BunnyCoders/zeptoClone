import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class SavedAddressesView extends StatefulWidget {
  const SavedAddressesView({super.key});

  @override
  State<SavedAddressesView> createState() => _SavedAddressesViewState();
}

class _SavedAddressesViewState extends State<SavedAddressesView> {
  Widget floatingButton() {
    return Padding(
      padding: const EdgeInsets.all(DSSizes.md),
      child: Button(
        onTap: () {},
        text: 'Add New Address',
        buttonType: ButtonTypes.filled,
      ),
    );
  }

  Widget savedAddresses() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/icons/address.svg',
              colorFilter:
                  const ColorFilter.mode(DSColors.primary, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: DSType.subtitle1(
                    context: context,
                    textColor: DSColors.headingDark,
                  ),
                ),
                SizedBox(
                  width: DSSizes.xxxl,
                  child: Text(
                    "D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, D-1/10A Budh Vihar Phase-1 delhi -  110086",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/pencil.svg',
                    colorFilter: const ColorFilter.mode(
                        DSColors.placeHolderDark, BlendMode.srcIn),
                    height: DSSizes.md,
                    width: DSSizes.md,
                  ),
                ),
                const SizedBox(
                  width: DSSizes.md,
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    colorFilter: const ColorFilter.mode(
                        DSColors.placeHolderDark, BlendMode.srcIn),
                    height: DSSizes.md,
                    width: DSSizes.md,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        savedAddresses(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Addresses',
        showBack: true,
        // isSmallText: false,
      ),
      child: _buildUI(),
      floatingActionButton: floatingButton(),
    );
    
  }
}
