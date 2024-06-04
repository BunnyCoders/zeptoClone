import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class SecondaryCategoryView extends StatefulWidget {
  const SecondaryCategoryView({super.key});

  @override
  State<SecondaryCategoryView> createState() => _SecondaryCategoryViewState();
}

class _SecondaryCategoryViewState extends State<SecondaryCategoryView> {
  @override
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

  Widget horizontalListOfCategories() {
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
      width: DSSizes.xl + DSSizes.lg,
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: categoriesData["categoriesDataList"][0]
                ["secondaryCategories"]
            .length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                    categoriesData["categoriesDataList"][0]
                        ["secondaryCategories"][index]['imageUrl'],
                    colorBlendMode: BlendMode.overlay,
                    height: DSSizes.xl + DSSizes.md,
                    width: DSSizes.xl + DSSizes.md,
                  ),
                ),
              ),
              Text(
                categoriesData["categoriesDataList"][0]["secondaryCategories"]
                    [index]['secondaryCategoryTitle'],
                style: DSType.smallBold(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget products() {
    return GridView.builder(
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["products"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: DSSizes.sm,
          mainAxisSpacing: DSSizes.sm,
          mainAxisExtent: 300,
        ),
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                    borderRadius:
                        BorderRadius.circular(DSSizes.sm), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(
                        DSSizes.xl + DSSizes.md,
                      ), // Image radius
                      child: Image.network(
                        homeData["products"][index]['imageUrl'],
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Image.network(
                  //     homeData["products"][index]['imageUrl'],
                  //     height: 200,
                  //     width: 200,
                  //   ),
                  // ),
                  const SizedBox(
                    height: DSSizes.sm,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    text: TextSpan(
                        text: homeData["products"][index]['productName'],
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.headingDark,
                        )),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: homeData["products"][index]['quantity'],
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
                            text: homeData["products"][index]['price'],
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

  Container bottomCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
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
    );
  }

  Row productsAndCategories() {
    return Row(
      children: [
        horizontalListOfCategories(),
        const SizedBox(
          width: DSSizes.xs,
        ),
        horizontalCategoryProducts(),
      ],
    );
  }

  Container horizontalCategoryProducts() {
    return Container(
      width: DSSizes.xxxl + DSSizes.md + DSSizes.sm,
      height: MediaQuery.of(context).size.height * 0.8,
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
      child: products(),
    );
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          productsAndCategories(),
          bottomCard(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        rightAction: _appBarAction(),
        title: 'Fruits & Vegetables',
        showBack: true,
        isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
