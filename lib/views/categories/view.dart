import 'dart:convert';
import 'package:zepto_clone/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/skeleton.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // List<PrimaryCategory> _primaryCategories = [];

  int _selectedPrimaryCategoryIndex = 0;

  // @override
  // void initState() {
  //   super.initState();

  //   _tabController = TabController(
  //     initialIndex: 0,
  //     length: 2,
  //     vsync: this,
  //   );

  //   _primaryCategories = json
  //       .decode(jsonEncode(categoriesData["primaryCategories"]))
  //       .map<PrimaryCategory>((val) => PrimaryCategory.fromJson(val))
  //       .toList();

  //   BlocProvider.of<CategoriesCubit>(context).getCategories();
  // }

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

  // Widget _dynamicSection() {
  //   Widget primaryCategories() {
  //     void onTapPrimaryCategory({required int selectedCategoryIndex}) {
  //       setState(() {
  //         _selectedPrimaryCategoryIndex = selectedCategoryIndex;
  //         _tabController.animateTo(1);
  //       });
  //     }

  //     return BlocBuilder<CategoriesCubit, CategoriesState>(
  //       builder: (context, state) {
  //         if (state is CategoriesInitialState) {
  //           return Container(
  //             alignment: Alignment.center,
  //             child: const Text("Initial state"),
  //           );
  //         } else if (state is CategoriesLoadingState) {
  //           return dynamicSectionSkeleton();
  //         } else if (state is CategoriesLoadedState) {
  //           return Padding(
  //             padding: const EdgeInsets.all(DSSizes.md),
  //             child: GridView.builder(
  //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 childAspectRatio: 3.5 / 2,
  //                 crossAxisCount: 2,
  //                 crossAxisSpacing: DSSizes.md,
  //                 mainAxisSpacing: DSSizes.md,
  //               ),
  //               itemCount: _primaryCategories.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return InkWell(
  //                   onTap: () =>
  //                       onTapPrimaryCategory(selectedCategoryIndex: index),
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(DSSizes.sm),
  //                       ),
  //                       color: DSColors.backgroundInputField,
  //                       image: DecorationImage(
  //                         image: NetworkImage(
  //                             _primaryCategories[index].imageUrl.toString()),
  //                       ),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(DSSizes.md),
  //                       child: Text(
  //                         _primaryCategories[index]
  //                             .primaryCategoryTitle
  //                             .toString(),
  //                         style: DSType.subtitle2(
  //                           context: context,
  //                           textColor: DSColors.headingDark,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           );
  //         }

  //         return const SizedBox.shrink();
  //       },
  //     );
  //   }

  //   Widget secondaryCategories() {
  //     void onTapBackArrow() {
  //       setState(() {
  //         _tabController.animateTo(0);
  //       });
  //     }

  //     void onTapTertiaryCategory({required String tertiaryCategory}) {
  //       Navigator.of(context).pushNamed(RoutePaths.products);
  //     }

  //     return BlocBuilder<CategoriesCubit, CategoriesState>(
  //       builder: (context, state) {
  //         if (state is CategoriesInitialState) {
  //           return Container(
  //             alignment: Alignment.center,
  //             child: const Text("Initial state"),
  //           );
  //         } else if (state is CategoriesLoadingState) {
  //           return secondaryCategoriesSkeleton();
  //         } else if (state is CategoriesLoadedState) {
  //           return SingleChildScrollView(
  //             child: Container(
  //               padding: const EdgeInsets.all(DSSizes.md),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () => onTapBackArrow(),
  //                     child: SvgPicture.asset(
  //                       'assets/icons/backArrow.svg',
  //                       colorFilter: const ColorFilter.mode(
  //                           Colors.black, BlendMode.srcIn),
  //                       height: DSSizes.md,
  //                       width: DSSizes.md,
  //                     ),
  //                   ),
  //                   const SizedBox(height: DSSizes.md),
  //                   ExpansionPanelList(
  //                     expansionCallback: (int index, bool isExpanded) {
  //                       setState(() {
  //                         _primaryCategories[_selectedPrimaryCategoryIndex]
  //                             .secondaryCategories![index]
  //                             .isExpanded = isExpanded;
  //                       });
  //                     },
  //                     children:
  //                         _primaryCategories[_selectedPrimaryCategoryIndex]
  //                             .secondaryCategories!
  //                             .map<ExpansionPanel>(
  //                       (SecondaryCategory secondaryCategory) {
  //                         return ExpansionPanel(
  //                           canTapOnHeader: true,
  //                           headerBuilder:
  //                               (BuildContext context, bool isExpanded) {
  //                             return Padding(
  //                               padding: const EdgeInsets.all(DSSizes.md),
  //                               child: Text(
  //                                 secondaryCategory.secondaryCategoryTitle
  //                                     .toString(),
  //                                 style: DSType.subtitle2(
  //                                   context: context,
  //                                   textColor: DSColors.bodyDark,
  //                                 ),
  //                               ),
  //                             );
  //                           },
  //                           isExpanded: secondaryCategory.isExpanded,
  //                           body: ListView.builder(
  //                             itemCount:
  //                                 secondaryCategory.tertiaryCategories!.length,
  //                             shrinkWrap: true,
  //                             itemBuilder: (BuildContext context, int index) {
  //                               return InkWell(
  //                                 onTap: () => onTapTertiaryCategory(
  //                                   tertiaryCategory: secondaryCategory
  //                                       .tertiaryCategories![index],
  //                                 ),
  //                                 child: Container(
  //                                   color: DSColors.backgroundGrey,
  //                                   margin: const EdgeInsets.only(
  //                                       bottom: DSSizes.xs),
  //                                   padding: const EdgeInsets.all(DSSizes.md),
  //                                   width: double.infinity,
  //                                   child: Text(
  //                                     secondaryCategory
  //                                         .tertiaryCategories![index],
  //                                     style: DSType.body2(
  //                                       context: context,
  //                                       textColor: DSColors.bodyDark,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               );
  //                             },
  //                           ),
  //                         );
  //                       },
  //                     ).toList(),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }

  //         return const SizedBox.shrink();
  //       },
  //     );
  //   }

  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height * 0.8,
  //     child: TabBarView(
  //       controller: _tabController,
  //       physics: const NeverScrollableScrollPhysics(),
  //       dragStartBehavior: DragStartBehavior.start,
  //       children: [
  //         primaryCategories(),
  //         secondaryCategories(),
  //       ],
  //     ),
  //   );
  // }

  Container secondaryCategoriesSkeleton() {
    return Container(
      padding: const EdgeInsets.all(DSSizes.md),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleSkeleton(
            size: DSSizes.lg,
          ),
          SizedBox(height: DSSizes.md),
          Skeleton(),
        ],
      ),
    );
  }

  // GridView dynamicSectionSkeleton() {
  //   return GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       childAspectRatio: 3.5 / 2,
  //       crossAxisCount: 2,
  //       crossAxisSpacing: DSSizes.md,
  //       mainAxisSpacing: DSSizes.md,
  //     ),
  //     itemCount: _primaryCategories.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return const Row(
  //         children: [
  //           SizedBox(
  //             width: DSSizes.md,
  //           ),
  //           Skeleton(
  //             height: DSSizes.lg,
  //             width: DSSizes.md,
  //           ),
  //           SizedBox(
  //             width: DSSizes.md,
  //           ),
  //           CircleSkeleton(
  //             size: DSSizes.lg,
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget _dynamicSection() {
    return GridView.builder(
      padding: const EdgeInsets.all(DSSizes.sm),
      itemCount: categoriesData["categoriesDataList"].length,
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
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed(
                    RoutePaths.secondaryCategory,
                  );
                });
              },
              child: Center(
                child: Image.network(
                  categoriesData["categoriesDataList"][index]['imageUrl'],
                  colorBlendMode: BlendMode.overlay,
                  // height: DSSizes.xl,
                  // width: DSSizes.xl,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget exploreNewCategorySection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Explore New Categories",
              style: DSType.h6(
                context: context,
                textColor: DSColors.headingDark,
              ),
            ),
          ),
        ),
        SizedBox(
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
        ),
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(height: DSSizes.md),
        _dynamicSection(),
        exploreNewCategorySection()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          context: context,
          rightAction: _appBarAction(),
          title: 'All Category',
          showBack: false),
      child: _buildUI(),
    );
  }
}
