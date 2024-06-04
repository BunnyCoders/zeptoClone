import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zepto_clone/data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DealsView extends StatefulWidget {
  const DealsView({super.key});

  @override
  State<DealsView> createState() => _DealsViewState();
}

class _DealsViewState extends State<DealsView> {
  Widget _appBarAction() {
    void onTapSearch() {
      Navigator.of(context).pushNamed(RoutePaths.search);
    }

    return Row(
      children: [
        GestureDetector(
          onTap: () => onTapSearch(),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            height: DSSizes.md,
            width: DSSizes.md,
          ),
        ),
      ],
    );
  }

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
          !isSeeAll == true
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

  Widget productForYouSection() {
    return GridView.builder(
        padding: const EdgeInsets.all(DSSizes.sm),
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
              child: Padding(
                padding: const EdgeInsets.all(DSSizes.xs),
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
                          text: homeData["productsForYouData"][index]
                              ['quantity'],
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
      height: 315,
      child: ListView.builder(
          padding: const EdgeInsets.all(DSSizes.sm),
          itemCount: freshofTheFarmsData["products"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(DSSizes.xs),
              child: SizedBox(
                height: 315,
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
                                  freshofTheFarmsData["products"][index]['imageUrl'],
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

  Widget popularCategories() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: freshofTheFarmsData["popularCategoriesData"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(DSSizes.xs),
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  freshofTheFarmsData["popularCategoriesData"][index]
                      ['imageUrl'],
                  height: 120,
                  width: 120,
                ),
              ),
            );
          }),
    );
  }

  Widget inFocusToday() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: freshofTheFarmsData["inFocusData"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Image.network(
                freshofTheFarmsData["inFocusData"][index]['imageUrl'],
                height: 120,
                width: 120,
              ),
            );
          }),
    );
  }

  Widget verticalImagesSlider() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: freshofTheFarmsData["verticalImagesData"].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(DSSizes.xs),
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  freshofTheFarmsData["verticalImagesData"][index]['imageUrl'],
                ),
              ),
            );
          }),
    );
  }

  Widget whiteBackgroundSection() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          DSSizes.md + DSSizes.sm,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: DSSizes.sm,
            ),
            headingSection(
              text: "Fresh From The Farms",
              onTap: () {},
            ),
            farmProductsUI(),
            headingSection(
              text: "In Focus Today",
              onTap: () {},
              isSeeAll: true,
            ),
            inFocusToday(),
            headingSection(
              text: "Suggested For You",
              onTap: () {},
            ),
            suggestedForYou(),
            headingSection(
              text: "Popular Categories",
              onTap: () {},
              isSeeAll: true,
            ),
            popularCategories(),
            headingSection(
              text: "Popular Items",
              onTap: () {},
              isSeeAll: false,
            ),
            suggestedForYou(),
            const SizedBox(
              height: DSSizes.md,
            ),
            verticalImagesSlider(),
            const SizedBox(
              height: DSSizes.md,
            ),
          ],
        ),
      ),
    );
  }

  Widget headingImageSection() {
    return Image.network(
      // 'https://img.freepik.com/free-vector/deal-promotional-banner-hanging-price-tag-style_1017-27325.jpg?size=626&ext=jpg&ga=GA1.1.1222169770.1701993600&semt=ais',
      'https://cdn.zeptonow.com/production///tr:w-969,ar-969-501,pr-true,f-auto,q-80/inventory/banner/e2bcfbde-71ff-4286-8bda-7a1173e1c759.png',
      fit: BoxFit.fill,
      height: DSSizes.xxxl,
    );
  }

  Widget _buildUI() {
    return Stack(
      children: [
        headingImageSection(),
        whiteBackgroundSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        rightAction: _appBarAction(),
        title: 'Deals',
      ),
      child: _buildUI(),
    );
  }
}
