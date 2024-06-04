import 'package:flutter/material.dart';
import 'package:zepto_clone/views/cart/views/upi_payment.dart';
import 'package:zepto_clone/views/login/view.dart';
import 'package:zepto_clone/views/otp/view.dart';
import 'package:zepto_clone/views/search/view.dart';
import 'package:zepto_clone/views/products/view.dart';
import 'package:zepto_clone/views/location/view.dart';
import 'package:zepto_clone/views/settings/view.dart';
import 'package:zepto_clone/views/root_tab_bar/view.dart';
import 'package:zepto_clone/views/cart/views/coupons.dart';
import 'package:zepto_clone/views/settings/views/refund/view.dart';
import 'package:zepto_clone/views/settings/views/orders/view.dart';
import 'package:zepto_clone/views/settings/views/profile/view.dart';
import 'package:zepto_clone/views/settings/views/generalInfo/view.dart';
import 'package:zepto_clone/views/settings/views/notifications/view.dart';
import 'package:zepto_clone/views/settings/views/savedAddresses/view.dart';
import 'package:zepto_clone/views/categories/secondaryCategories/view.dart';
import 'package:zepto_clone/views/settings/views/customerSupport/view.dart';
import 'package:zepto_clone/views/settings/views/orders/orderDetail/view.dart';

// all the route paths in the application
class RoutePaths {
  static const String savedAddresses = '/addresses';
  static const String customerCare = '/customer_care';
  static const String orderDetail = '/order_detail';
  static const String orders = '/orders';
  static const String profile = '/profile';
  static const String coupon = '/coupon';
  static const String login = '/login';
  static const String notification = '/notification';
  static const String otp = '/otp';
  static const String product = '/product';
  static const String products = '/products';
  static const String rootTabBar = '/root_tab_bar';
  static const String search = '/search';
  static const String wishlist = '/wishlist';
  static const String secondaryCategory = '/secondaryCategory';
  static const String settings = '/settings';
  static const String refunds = '/refunds';
  static const String generalInfo = '/generalInfo';
  static const String location = '/location';
  static const String productDetails = '/productDetails';
  static const String upiPayment = '/upi_payment';
}

// routing logic
class AppRouter {
  static _authCheck({required MaterialPageRoute materialPageRoute}) {
    if (2 == 2) {
      return materialPageRoute;
    } else {
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RoutePaths.otp:
        return MaterialPageRoute(
          builder: (context) => const OtpView(),
        );
      case RoutePaths.secondaryCategory:
        return MaterialPageRoute(
          builder: (context) => const SecondaryCategoryView(),
        );
      case RoutePaths.settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
        );
      case RoutePaths.orders:
        return MaterialPageRoute(
          builder: (context) => const OrdersView(),
        );
      case RoutePaths.customerCare:
        return MaterialPageRoute(
          builder: (context) => const CustomerSupportView(),
        );
      case RoutePaths.savedAddresses:
        return MaterialPageRoute(
          builder: (context) => const SavedAddressesView(),
        );
      case RoutePaths.refunds:
        return MaterialPageRoute(
          builder: (context) => const RefundView(),
        );
      case RoutePaths.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );
      case RoutePaths.generalInfo:
        return MaterialPageRoute(
          builder: (context) => const GeneralInfoView(),
        );
      case RoutePaths.notification:
        return MaterialPageRoute(
          builder: (context) => const NotificationView(),
        );
      case RoutePaths.coupon:
        return MaterialPageRoute(
          builder: (context) => const CouponsView(),
        );
      case RoutePaths.search:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );
      case RoutePaths.orderDetail:
        return MaterialPageRoute(
          builder: (context) => const OrderDetailsView(),
        );
      case RoutePaths.location:
        return MaterialPageRoute(
          builder: (context) => const LocationView(),
        );
      case RoutePaths.productDetails:
        return MaterialPageRoute(
          builder: (context) => const ProductsDatailsView(),
        );
      case RoutePaths.upiPayment:
        return MaterialPageRoute(
          builder: (context) => const UpiPaymentView(),
        );

      case RoutePaths.rootTabBar:
        final args = settings.arguments as RootTabBarViewArgument;

        return MaterialPageRoute(
          builder: (context) => RootTabBarView(
            selectedPage: args.selectedIndex,
          ),
        );
    }

    return MaterialPageRoute(
      builder: (context) => const Text(
        'Replace with page not found',
      ),
    );
  }
}

// argument classes, data can be only passed between two views using these objects
class RootTabBarViewArgument {
  int selectedIndex;

  RootTabBarViewArgument({
    required this.selectedIndex,
  });
}
