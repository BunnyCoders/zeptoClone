import 'package:zepto_clone/data.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:zepto_clone/views/home/storyView.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/global_components/skeleton.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// ignore_for_file: prefer_const_constructors

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    // BlocProvider.of<HomeDataCubit>(context).getHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTapImage({required redirectData}) {}

  void onTapSearch() {
    Navigator.of(context).pushNamed(RoutePaths.search);
  }

  void onTapLocation() {
    Navigator.of(context).pushNamed(RoutePaths.location);
  }

  void onTapProfile() {
    Navigator.of(context).pushNamed(RoutePaths.settings);
  }

  Widget storySection() {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(width: DSSizes.md);
          }
          return GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
              return StoryViewPage(storiesData, index);
            })),
            child: Container(
              margin: EdgeInsets.all(DSSizes.sm),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 2),
                    blurRadius: DSSizes.md,
                  ),
                ],
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    height: DSSizes.xl,
                    width: DSSizes.xl,
                    image: AssetImage(stories[index - 1]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget imageSection() {
    return SizedBox(
      height: DSSizes.xxl + DSSizes.xxl,
      child: ListView.separated(
        padding: EdgeInsets.all(DSSizes.md),
        shrinkWrap: true,
        itemCount: homeData["topImagesListData"].length,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              homeData["topImagesListData"][index]['imageUrl'],
              height: DSSizes.xxxl,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: DSSizes.sm),
      ),
    );
  }

  Widget productForYouHeadingSection() {
    return Padding(
      padding: const EdgeInsets.all(
        DSSizes.md,
      ),
      child: Center(
        child: Text(
          "Products For You",
          style: DSType.h6(
            context: context,
            textColor: DSColors.headingDark,
          ),
        ),
      ),
    );
  }

  Widget productForYouSection() {
    return GridView.builder(
        padding: EdgeInsets.all(DSSizes.sm),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutePaths.productDetails,
                );
              },
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

  Widget products() {
    return GridView.builder(
        padding: EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["products"].length,
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
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(DSSizes.sm), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(
                            DSSizes.xl + DSSizes.md,
                          ), // Image radius
                          child: Image.network(
                            homeData["products"][index]['imageUrl'],
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
                                Icon(
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
        });
  }

  Widget verticalImageListSection() {
    return SizedBox(
      height: DSSizes.xxl + DSSizes.xl,
      child: ListView.separated(
        padding: EdgeInsets.all(DSSizes.md),
        shrinkWrap: true,
        itemCount: homeData["verticalImagesListData"].length,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              homeData["verticalImagesListData"][index]['imageUrl'],
              height: DSSizes.xxl,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: DSSizes.sm),
      ),
    );
  }

  Widget exploreByCategoriesHeadingSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Explore By Categories",
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
                textColor: DSColors.headingDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget exploreByCategoriesProductsSection() {
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
      child: GridView.builder(
        padding: EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["exploreByCategoriesData"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: DSSizes.md,
          mainAxisSpacing: DSSizes.sm,
          mainAxisExtent: DSSizes.xxl + DSSizes.sm,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                    homeData["exploreByCategoriesData"][index]['imageUrl'],
                    colorBlendMode: BlendMode.overlay,
                    // height: DSSizes.xl,
                    // width: DSSizes.xl,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget exploreNewCategorySection() {
    return SizedBox(
      width: double.infinity,
      height: DSSizes.xxl + DSSizes.lg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.sm),
        itemCount: homeData["exploreNewCategoriesData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                    homeData["exploreNewCategoriesData"][index]['imageUrl'],
                    colorBlendMode: BlendMode.overlay,
                    height: DSSizes.xxl,
                    width: DSSizes.xxl,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget featuredForYouSection() {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.sm),
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

  Widget brandsInFocusSection() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.xs),
        itemCount: homeData["brandsInFocusData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                      homeData["brandsInFocusData"][index]['imageUrl'],
                      colorBlendMode: BlendMode.overlay,
                      height: DSSizes.xxl + DSSizes.xl,
                      width: DSSizes.xxl + DSSizes.md),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget bigPacksBigSavingsSection() {
    return Container();
  }

  Widget checkThisOutSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(DSSizes.md),
          child: InkWell(
            onTap: () {},
            child: Image.network(
              "https://cdn.zeptonow.com/production///tr:w-640,ar-984-294,pr-true,f-auto,q-80/inventory/banner/638b1862-cb1c-47b4-b388-936ac601ca75.png",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Image(
              image: NetworkImage(
                  "https://cdn.zeptonow.com/production///tr:w-468,ar-468-540,pr-true,f-auto,q-80/inventory/banner/ad2f022d-7141-4e4b-b059-f577c77cf811.png"),
              height: DSSizes.xxl + DSSizes.xl,
              width: DSSizes.xxl + DSSizes.xl,
            ),
            Image(
              image: NetworkImage(
                  "https://cdn.zeptonow.com/production///tr:w-468,ar-468-540,pr-true,f-auto,q-80/inventory/banner/4c3ffaca-ec8f-4009-a267-e4cf3b3ebbb1.png"),
              height: DSSizes.xxl + DSSizes.xl,
              width: DSSizes.xxl + DSSizes.xl,
            ),
          ],
        )
      ],
    );
  }

  Widget fruitsImagesList() {
    return SizedBox(
      // color: DSColors.primary,
      width: double.infinity,
      height: DSSizes.xxxl + DSSizes.md + DSSizes.lg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.xs),
        itemCount: homeData["fruitsImagesData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              InkWell(
                onTap: () {},
                child: Image.network(
                  homeData["fruitsImagesData"][index]['imageUrl'],
                  height: DSSizes.xxxl + DSSizes.lg,
                  width: DSSizes.xxxl + DSSizes.xl + DSSizes.md,
                ),
              ),
              Positioned(
                bottom: DSSizes.lg,
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
                            homeData["fruitsImagesData"][index]['quantity'],
                            style: DSType.body1(
                              context: context,
                              textColor: DSColors.headingLight,
                            ),
                          ),
                          SizedBox(
                            height: DSSizes.sm,
                          ),
                          Text(
                            homeData["fruitsImagesData"][index]['price'],
                            style: DSType.subtitle1(
                              context: context,
                              decorationColor: DSColors.headingDark,
                              textColor: DSColors.headingLight,
                              isLineThrough: true,
                            ),
                          ),
                          Text(
                            homeData["fruitsImagesData"][index]
                                ['discountPrice'],
                            style: DSType.h6(
                              context: context,
                              textColor: DSColors.headingLight,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: DSSizes.lg,
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
              )
            ],
          );
        },
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: homeData["carouselImages"].length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          InkWell(
        onTap: () => onTapImage(
          redirectData: homeData["carouselImages"][itemIndex]["redirectData"],
        ),
        child: Image(
          fit: BoxFit.fitWidth,
          width: double.infinity,
          image: NetworkImage(
            homeData["carouselImages"][itemIndex]["imageUrl"],
          ),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 10,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {},
      ),
    );
  }

  Widget secondaryCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: homeData["secondaryCarouselImages"].length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          InkWell(
        onTap: () => onTapImage(
          redirectData: homeData["secondaryCarouselImages"][itemIndex]
              ["redirectData"],
        ),
        child: Image(
          fit: BoxFit.fitWidth,
          width: double.infinity,
          image: NetworkImage(
            homeData["secondaryCarouselImages"][itemIndex]["imageUrl"],
          ),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 10,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {},
      ),
    );
  }

  Widget bestDealsImagesSection() {
    return SizedBox(
      width: double.infinity,
      height: DSSizes.xxxl + DSSizes.md + DSSizes.lg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.sm),
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
                          SizedBox(
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
                      SizedBox(
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
              )
            ],
          );
        },
      ),
    );
  }

  Widget curatedForYouSection() {
    return GridView.builder(
      itemCount: homeData["curatedForYouData"].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: DSSizes.sm,
        mainAxisSpacing: 0,
        mainAxisExtent: 100,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Image.network(
            homeData["curatedForYouData"][index]['imageUrl'],
          ),
        );
      },
    );
  }

  Widget headingSection({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: DSType.h6(
            context: context,
            textColor: DSColors.headingDark,
          ),
        ),
      ),
    );
  }

  Widget mustTryThisWeekSection() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(DSSizes.xs),
        itemCount: homeData["mustTryThisWeekData"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.network(
                      homeData["mustTryThisWeekData"][index]['imageUrl'],
                      colorBlendMode: BlendMode.overlay,
                      height: DSSizes.xxl + DSSizes.xl,
                      width: DSSizes.xxl + DSSizes.md),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          storySection(),
          imageSection(),
          productForYouHeadingSection(),
          productForYouSection(),
          verticalImageListSection(),
          exploreByCategoriesHeadingSection(),
          exploreByCategoriesProductsSection(),
          headingSection(text: 'Explore New Categories'),
          exploreNewCategorySection(),
          products(),
          headingSection(text: 'Featured For You'),
          featuredForYouSection(),
          products(),
          headingSection(text: 'Brand In Focus'),
          brandsInFocusSection(),
          products(),
          headingSection(text: 'Big Pack Big Savings'),
          bigPacksBigSavingsSection(),
          products(),
          headingSection(text: 'Check This out'),
          checkThisOutSection(),
          products(),
          fruitsImagesList(),
          products(),
          carouselSlider(),
          products(),
          secondaryCarouselSlider(),
          products(),
          headingSection(text: 'Best Deals'),
          bestDealsImagesSection(),
          products(),
          headingSection(text: 'Curated For You'),
          curatedForYouSection(),
          products(),
          headingSection(text: 'Must Try This Week'),
          mustTryThisWeekSection(),
          products(),
          products(),
        ],
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 130.0,
      floating: false,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        title: GestureDetector(
          onTap: () => onTapSearch(),
          child: Container(
            height: DSSizes.lg,
            width: DSSizes.xxl + DSSizes.xl + DSSizes.lg,
            decoration: BoxDecoration(
              border: Border.all(
                color: DSColors.borderLight,
                width: 1,
              ),
              color: DSColors.backgroundGrey,
              borderRadius: BorderRadius.circular(DSSizes.sm),
            ),
            padding: const EdgeInsets.only(
              bottom: DSSizes.xs,
              left: DSSizes.xs,
              right: DSSizes.xs,
              top: DSSizes.xs,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(DSSizes.xs),
                  child: Icon(
                    Icons.search,
                    size: DSSizes.md,
                    color: DSColors.headingDark,
                  ),
                ),
                const SizedBox(width: DSSizes.md),
                Text(
                  "Search by product",
                  style: DSType.body2(
                    context: context,
                    textColor: DSColors.placeHolderDark,
                  ),
                ),
              ],
            ),
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(
            bottom: DSSizes.lg.h,
            top: 55.h,
          ),
          decoration: const BoxDecoration(
            color: DSColors.plasma1,
            boxShadow: DSShadows.buttonCard,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: DSSizes.sm),
                  GestureDetector(
                    onTap: () => onTapProfile(),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      height: DSSizes.lg,
                      width: DSSizes.lg,
                    ),
                  ),
                  SizedBox(
                    width: DSSizes.lg,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery in 10 Mins",
                        style: DSType.h6(
                          context: context,
                          textColor: DSColors.headingDark,
                        ),
                      ),
                      InkWell(
                        onTap: () => onTapLocation(),
                        child: SizedBox(
                          width: DSSizes.xxxl,
                          child: Text(
                            savedAddressesData["savedAddresses"][0]
                                    ["buildingName"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["locality"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["landmark"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["city"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["district"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["state"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["country"] +
                                ", " +
                                savedAddressesData["savedAddresses"][0]
                                    ["pincode"],
                            style: DSType.subtitle1(
                              context: context,
                              textColor: DSColors.headingDark,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: DSSizes.md),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _appBar(context),
          ];
        },
        body: _buildUI(),
      ),
    );
  }
}
