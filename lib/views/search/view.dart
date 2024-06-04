import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTextFieldController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchTextFieldController.dispose();

    super.dispose();
  }

  void onTapSearch({String searchQuery = ''}) {
    _searchTextFieldController.text = searchQuery;

    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(RoutePaths.search);
    }
  }

  PreferredSize _appBar() {
    void onTapBack() {
      Navigator.of(context).pop();
    }

    void onChanged() {}

    void onSubmit() {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).pushNamed(RoutePaths.search);
      }
    }

    return PreferredSize(
      preferredSize: Size.fromHeight(120.h),
      child: Container(
        decoration: const BoxDecoration(
          color: DSColors.backgroundLight,
          boxShadow: DSShadows.bottomSheet,
        ),
        padding: EdgeInsets.only(
          bottom: DSSizes.md.h,
          top: 64.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: DSSizes.md),
            InkWell(
              onTap: onTapBack,
              child: Container(
                padding: const EdgeInsets.only(
                  right: DSSizes.sm,
                ),
                child: SvgPicture.asset(
                  'assets/icons/backArrow.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
            const SizedBox(width: DSSizes.md),
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _searchTextFieldController,
                  cursorColor: DSColors.headingDark,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      bottom: DSSizes.md,
                      left: DSSizes.md,
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          DSSizes.sm,
                        ),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        color: DSColors.borderLight,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          DSSizes.xs,
                        ),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        color: DSColors.borderLight,
                      ),
                    ),
                    errorStyle: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                    filled: true,
                    fillColor: DSColors.backgroundGrey,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintStyle: DSType.body2(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                    isDense: true,
                    labelStyle: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                    labelText: 'Search by product, branch & more',
                    suffixIcon: IconButton(
                      onPressed: () => onTapSearch(),
                      icon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        colorFilter: const ColorFilter.mode(
                          DSColors.headingDark,
                          BlendMode.srcIn,
                        ),
                        height: 16.h,
                        width: 16.h,
                      ),
                    ),
                  ),
                  onChanged: (value) => onChanged,
                  onFieldSubmitted: (value) => onSubmit(),
                  style: DSType.body2(
                    context: context,
                    textColor: DSColors.headingDark,
                  ),
                  validator: (String? value) {},
                ),
              ),
            ),
            const SizedBox(width: DSSizes.md),
          ],
        ),
      ),
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
                            Image.network(
                              freshofTheFarmsData["products"][index]
                                  ['imageUrl'],
                              height: 200,
                              width: 200,
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
                            Image.network(
                              freshofTheFarmsData["products"][index]
                                  ['imageUrl'],
                              height: 200,
                              width: 200,
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

  Widget _buildUI() {
    return Column(
      children: [
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: _appBar(),
      child: _buildUI(),
    );
  }
}
