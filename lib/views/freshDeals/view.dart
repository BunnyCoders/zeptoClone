import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zepto_clone/global_components/custom_silver_app_bar.dart';

class FreshDealsView extends StatefulWidget {
  const FreshDealsView({super.key});

  @override
  State<FreshDealsView> createState() => _FreshDealsViewState();
}

class _FreshDealsViewState extends State<FreshDealsView> {
  Widget productForYouSection() {
    return GridView.builder(
        // padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["productsForYouData"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: DSSizes.sm,
          mainAxisExtent: 205,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(DSSizes.xs),
            ),
            color: Colors.white,
            elevation: 1,
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      homeData["productsForYouData"][index]['imageUrl'],
                      height: DSSizes.xl,
                      width: DSSizes.xl,
                    ),
                  ),
                  const SizedBox(
                    height: DSSizes.sm,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 2,
                    text: TextSpan(
                        text: homeData["productsForYouData"][index]
                            ['productName'],
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.headingDark,
                        )),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: homeData["productsForYouData"][index]['quantity'],
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.placeHolderDark,
                        )),
                  ),
                  const SizedBox(
                    height: DSSizes.sm,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: homeData["productsForYouData"][index]
                                ['price'],
                            style: DSType.subtitle1(
                              context: context,
                              textColor: DSColors.headingDark,
                            )),
                      ),
                      // Spacer(),
                      Button(
                        onTap: () {},
                        text: 'Add',
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget farmProductsUI() {
    return SizedBox(
      height: 355,
      child: ListView.builder(
          padding: const EdgeInsets.all(DSSizes.sm),
          itemCount: freshofTheFarmsData["products"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(DSSizes.xs),
              child: SizedBox(
                height: 355,
                width: 160,
                child: Stack(
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(DSSizes.sm),
                      ),
                      elevation: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  DSSizes.sm), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(
                                  DSSizes.xl + DSSizes.md,
                                ), // Image radius
                                child: Image.network(
                                  freshofTheFarmsData["products"][index]
                                      ['imageUrl'],
                                  fit: BoxFit.fill,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                              softWrap: true,
                              text: TextSpan(
                                text: freshofTheFarmsData["products"][index]
                                    ['productName'],
                                style: DSType.subtitle1(
                                  context: context,
                                  textColor: DSColors.headingDark,
                                ),
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: freshofTheFarmsData["products"][index]
                                      ['quantity'],
                                  style: DSType.subtitle1(
                                    context: context,
                                    textColor: DSColors.placeHolderDark,
                                  )),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: freshofTheFarmsData["products"][index]
                                      ['originalPrice'],
                                  style: DSType.subtitle1(
                                      context: context,
                                      textColor: DSColors.placeHolderDark,
                                      isLineThrough: true)),
                            ),
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: freshofTheFarmsData["products"]
                                          [index]['discountPrice'],
                                      style: DSType.subtitle1(
                                        context: context,
                                        textColor: DSColors.headingDark,
                                      )),
                                ),
                                // Spacer(),
                                Button(
                                  onTap: () {},
                                  text: 'Add',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // freshofTheFarmsData["products"][index]["isDiscountOn"] == true
                    // ?
                    Positioned.fill(
                      top: DSSizes.xs,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ClipPath(
                          clipper: PointsClipper(),
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: DSColors.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(DSSizes.sm),
                                // bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: DSSizes.sm, left: DSSizes.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        freshofTheFarmsData["products"][index]
                                            ["discountPercent"],
                                        style: DSType.smallBold(
                                          context: context,
                                          textColor: DSColors.backgroundLight,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.percent,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Off",
                                    style: DSType.smallBold(
                                      context: context,
                                      textColor: DSColors.backgroundLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    // : const SizedBox.shrink(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget suggestedForYou() {
    return SizedBox(
      height: 355,
      child: ListView.builder(
          padding: const EdgeInsets.all(DSSizes.sm),
          itemCount: freshofTheFarmsData["products"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(DSSizes.xs),
              child: SizedBox(
                height: 350,
                width: 160,
                child: Stack(
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(DSSizes.sm),
                      ),
                      elevation: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  DSSizes.sm), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(
                                  DSSizes.xl + DSSizes.md,
                                ), // Image radius
                                child: Image.network(
                                  freshofTheFarmsData["products"][index]
                                      ['imageUrl'],
                                  fit: BoxFit.fill,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                              softWrap: true,
                              text: TextSpan(
                                text: freshofTheFarmsData["products"][index]
                                    ['productName'],
                                style: DSType.subtitle1(
                                  context: context,
                                  textColor: DSColors.headingDark,
                                ),
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: freshofTheFarmsData["products"][index]
                                      ['quantity'],
                                  style: DSType.subtitle1(
                                    context: context,
                                    textColor: DSColors.placeHolderDark,
                                  )),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: freshofTheFarmsData["products"][index]
                                      ['originalPrice'],
                                  style: DSType.subtitle1(
                                      context: context,
                                      textColor: DSColors.placeHolderDark,
                                      isLineThrough: true)),
                            ),
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: freshofTheFarmsData["products"]
                                          [index]['discountPrice'],
                                      style: DSType.subtitle1(
                                        context: context,
                                        textColor: DSColors.headingDark,
                                      )),
                                ),
                                // Spacer(),
                                Button(
                                  onTap: () {},
                                  text: 'Add',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // freshofTheFarmsData["products"][index]["isDiscountOn"] == true
                    // ?
                    Positioned.fill(
                      top: DSSizes.xs,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ClipPath(
                          clipper: PointsClipper(),
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: DSColors.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(DSSizes.sm),
                                // bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: DSSizes.sm, left: DSSizes.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        freshofTheFarmsData["products"][index]
                                            ["discountPercent"],
                                        style: DSType.smallBold(
                                          context: context,
                                          textColor: DSColors.backgroundLight,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.percent,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Off",
                                    style: DSType.smallBold(
                                      context: context,
                                      textColor: DSColors.backgroundLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    // : const SizedBox.shrink(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Fresh Fiesta',
        style: DSType.h6(
          context: context,
          textColor: DSColors.headingDark,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(DSSizes.md),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
          ),
        ),
      ],
    );
  }

  // Container explosiveDiscountHeadingSection(BuildContext context) {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     child: Text(
  //       "Explosive Discount On",
  //       style: DSType.subtitle1(
  //         context: context,
  //         textColor: DSColors.headingDark,
  //       ),
  //     ),
  //   );
  // }
  Widget headingSection({
    required String text,
    Function? onTap,
    bool isSeeAll = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingDark,
            ),
          ),
          isSeeAll == true
              ? InkWell(
                  onTap: () => onTap,
                  child: Text(
                    "See All",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.secondary,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget bestDealsForYou() {
    return SizedBox(
      width: double.infinity,
      height: DSSizes.xxxl + DSSizes.md + DSSizes.lg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["bestDealsForYouData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              InkWell(
                onTap: () {},
                child: Image.network(
                  homeData["bestDealsForYouData"][index]['imageUrl'],
                  height: DSSizes.xxxl + DSSizes.lg,
                  width: DSSizes.xxxl + DSSizes.xl + DSSizes.md,
                ),
              ),
              Positioned(
                bottom: DSSizes.sm,
                child: Padding(
                  padding: const EdgeInsets.all(DSSizes.md),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeData["bestDealsForYouData"][index]['quantity'],
                            style: DSType.body1(
                              context: context,
                              textColor: DSColors.headingLight,
                            ),
                          ),
                          const SizedBox(
                            height: DSSizes.sm,
                          ),
                          Text(
                            homeData["bestDealsForYouData"][index]['price'],
                            style: DSType.subtitle1(
                              context: context,
                              decorationColor: DSColors.headingDark,
                              textColor: DSColors.headingLight,
                              isLineThrough: true,
                            ),
                          ),
                          Text(
                            homeData["bestDealsForYouData"][index]
                                ['discountPrice'],
                            style: DSType.h6(
                              context: context,
                              textColor: DSColors.headingLight,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: DSSizes.xxl + DSSizes.xl,
                      ),
                      Button(
                        isDisabled: true,
                        buttonType: ButtonTypes.filled,
                        onTap: () {},
                        text: 'Add',
                        textColor: DSColors.headingLight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget featuredForYou() {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["featureForYouData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                    homeData["featureForYouData"][index]['imageUrl'],
                    colorBlendMode: BlendMode.overlay,
                    height: DSSizes.xxxl,
                    width: DSSizes.xxxl,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const CustomSilverAppBar(
          imagePath:
              'https://i0.wp.com/greebleagro.com/wp-content/uploads/2019/03/online-vegetables-in-gurgaon-1024x563.jpg?fit=1024%2C563&ssl=1',
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingSection(
                  text: 'Explosive Discount On',
                  isSeeAll: false,
                ),
                bestDealsForYou(),
                headingSection(
                  text: 'Daily Basket',
                  isSeeAll: true,
                ),
                suggestedForYou(),
                headingSection(
                  text: 'Explore Pantry',
                  isSeeAll: true,
                ),
                featuredForYou(),
                headingSection(
                  text: 'You May Also Like',
                  isSeeAll: true,
                ),
                productForYouSection(),
                headingSection(
                  text: 'Fresh Fruits',
                  isSeeAll: true,
                ),
                farmProductsUI(),
                const SizedBox(
                  height: DSSizes.md,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
}
