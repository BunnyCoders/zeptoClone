import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zepto_clone/views/cart/view.dart';
import 'package:zepto_clone/views/home/view.dart';
import 'package:zepto_clone/views/deals/view.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/views/categories/view.dart';
import 'package:zepto_clone/views/freshDeals/view.dart';
// ignore_for_file: must_be_immutable


class RootTabBarView extends StatefulWidget {
  int selectedPage = 0;
  RootTabBarView({
    super.key,
    required this.selectedPage,
  });

  @override
  State<RootTabBarView> createState() => _RootTabBarViewState();
}

class _RootTabBarViewState extends State<RootTabBarView> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();

    _selectedTabIndex = widget.selectedPage;
  }

  Widget _tabBarView() {
    if (_selectedTabIndex == 0) {
      return const HomeView();
      // return MultiBlocProvider(
      //   providers: [
      //     BlocProvider<HomeDataCubit>(
      //       create: (BuildContext context) => HomeDataCubit(),
      //     ),
      //   ],
      //   child: const HomeView(),
      // );
    } else if (_selectedTabIndex == 1) {
      return const CategoriesView();
    } else if (_selectedTabIndex == 2) {
      return const FreshDealsView();
    } else if (_selectedTabIndex == 3) {
      return const DealsView();
    } else if (_selectedTabIndex == 4) {
      return const CartView();
    }

    return const HomeView();
  }

  Widget _bottomNavigationBar() {
    void onTapTabBar({required int selectedIndex}) {
      setState(() {
        _selectedTabIndex = selectedIndex;
      });
    }

    return Container(
      decoration: const BoxDecoration(
        boxShadow: DSShadows.navigationMenu,
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (int selectedIndex) => onTapTabBar(selectedIndex: selectedIndex),
        selectedItemColor: DSColors.primary,
        selectedLabelStyle: DSType.navigation(context: context),
        unselectedLabelStyle: DSType.small(context: context),
        unselectedItemColor: DSColors.headingDark,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/widget-icon.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cheers.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            label: 'Fresh Deals',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/offer-icon.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shopping-cart-icon.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: DSSizes.md,
              width: DSSizes.md,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return _tabBarView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: _buildUI(),
    );
  }
}
