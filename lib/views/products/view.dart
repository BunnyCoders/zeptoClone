import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProductsDatailsView extends StatefulWidget {
  const ProductsDatailsView({super.key});

  @override
  State<ProductsDatailsView> createState() => _ProductsDatailsViewState();
}

class _ProductsDatailsViewState extends State<ProductsDatailsView> {
  int carouselIndexes = 0;
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

  Widget productImageSection() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: productDetailsData["productImageUrls"].length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            // onTap: () => onTapImage(
            //   redirectData: data["carouselImages"][itemIndex]["redirectData"],
            // ),
            child: Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              image: NetworkImage(
                productDetailsData["productImageUrls"][itemIndex],
              ),
            ),
          ),
          options: CarouselOptions(
            aspectRatio: 16 / 10,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                carouselIndexes = index;
              });
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: DSSizes.md,
          width: double.infinity,
          child: ListView.separated(
            itemCount: productDetailsData["productImageUrls"].length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: DSSizes.md,
                height: DSSizes.md,
                margin: const EdgeInsets.symmetric(horizontal: DSSizes.xs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: carouselIndexes == index
                      ? DSColors.secondary
                      : DSColors.borderDark,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: DSSizes.sm),
          ),
        ),
      ],
    );
  }

  Widget productDetailsSection() {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productDetailsData["productName"],
              style: DSType.h6(
                context: context,
                textColor: DSColors.headingDark,
              ),
            ),
            const SizedBox(
              height: DSSizes.sm,
            ),
            Text(
              productDetailsData["productQuantity"],
              style: DSType.body1(
                context: context,
                textColor: DSColors.placeHolderDark,
              ),
            ),
            const SizedBox(
              height: DSSizes.sm,
            ),
            Padding(
              padding: const EdgeInsets.all(DSSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetailsData["productFinalPrice"],
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.headingDark,
                        ),
                      ),
                      const SizedBox(
                        width: DSSizes.sm,
                      ),
                      Text(
                        productDetailsData["productOriginalPrice"],
                        style: DSType.body1(
                          context: context,
                          textColor: DSColors.headingDark,
                          isLineThrough: true,
                        ),
                      ),
                      const SizedBox(
                        width: DSSizes.sm,
                      ),
                      Container(
                        height: DSSizes.md,
                        width: DSSizes.lg + DSSizes.md,
                        decoration: BoxDecoration(
                            color: DSColors.primary,
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
                            productDetailsData["productDiscountPercentage"] +
                                " % Off",
                            style: DSType.smallBold(
                                context: context,
                                textColor: DSColors.headingLight),
                          ),
                        ),
                      )
                    ],
                  ),
                  Button(
                    onTap: () {},
                    text: 'Add',
                    buttonType: ButtonTypes.filled,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headingSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Similar Products For You",
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingDark,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "See All",
              style: DSType.subtitle1(
                context: context,
                textColor: DSColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productInformation() {
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      shape: const Border(),
      title: Text(
        "Product Information",
        style: DSType.subtitle1(
          context: context,
          textColor: DSColors.bodyDark,
        ),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(DSSizes.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                  const SizedBox(
                    width: DSSizes.xs,
                  ),
                  Expanded(
                    child: Text(
                      productDetailsData["productInformation"]["description"],
                      maxLines: 20,
                      style: DSType.body2(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DSSizes.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Origin:",
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                  const SizedBox(
                    width: DSSizes.lg,
                  ),
                  Text(
                    productDetailsData["productInformation"]["countryOfOrigin"],
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DSSizes.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shelf Life:",
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                  const SizedBox(
                    width: DSSizes.md,
                  ),
                  Text(
                    productDetailsData["productInformation"]["shelfLife"],
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget similarProductsSection() {
    return Container(
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
      child: Column(
        children: [
          headingSection(),
          GridView.builder(
              padding: const EdgeInsets.all(DSSizes.sm),
              itemCount: productDetailsData["similarProducts"].length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: DSSizes.xs,
                mainAxisSpacing: DSSizes.sm,
                mainAxisExtent: 310,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
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
                            Center(
                              child: Image.network(
                                productDetailsData["similarProducts"][index]
                                    ['productImageUrl'],
                                height: 200,
                                width: 200,
                              ),
                            ),
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              softWrap: true,
                              text: TextSpan(
                                  text: productDetailsData["similarProducts"]
                                      [index]['productName'],
                                  style: DSType.subtitle1(
                                    context: context,
                                    textColor: DSColors.headingDark,
                                  )),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: productDetailsData["similarProducts"]
                                      [index]['productQuantity'],
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
                                      text:
                                          productDetailsData["similarProducts"]
                                              [index]['productOriginalPrice'],
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
                                        "10",
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
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        productImageSection(),
        productDetailsSection(),
        const SizedBox(
          height: DSSizes.md,
        ),
        _productInformation(),
        const SizedBox(
          height: DSSizes.md,
        ),
        similarProductsSection()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
          context: context,
          rightAction: _appBarAction(),
          title: '',
          showBack: true),
      child: _buildUI(),
    );
  }
}
