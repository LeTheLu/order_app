import 'package:get/get.dart';
import 'package:order_app/binding/first_home_bindings.dart';
import 'package:order_app/binding/select_location.dart';
import 'package:order_app/binding/singup_binding.dart';
import 'package:order_app/models/product.dart';
import 'package:order_app/page/account/account.dart';
import 'package:order_app/page/beverages/beverages.dart';
import 'package:order_app/page/favorites/favorites.dart';
import 'package:order_app/page/filters/filters.dart';
import 'package:order_app/page/find_products/find_products.dart';
import 'package:order_app/page/first_home/first_home.dart';
import 'package:order_app/page/home/home_src.dart';
import 'package:order_app/page/login/login.dart';
import 'package:order_app/page/my_cart/my_cart.dart';
import 'package:order_app/page/number/number.dart';
import 'package:order_app/page/onbording/onbording.dart';
import 'package:order_app/page/order_accepted/order_accepted.dart';
import 'package:order_app/page/product_detail/product_detail.dart';
import 'package:order_app/page/search/search.dart';
import 'package:order_app/page/select_location/select_location.dart';
import 'package:order_app/page/signin/signin.dart';
import 'package:order_app/page/singup/singup.dart';
import 'package:order_app/page/verification/verification.dart';
import 'package:order_app/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const FirstHome(),
      binding: FirstHomeBindings(),
    ),
    GetPage(
      name: Routes.WELCOME_PAGE,
      page: () =>  const Onbording(),
    ),
    GetPage(
      name: Routes.SINGIN,
      page: () => const SignIn(),
    ),
    GetPage(
      name: Routes.NUMBER,
      page: () => const Number(),
    ),
    GetPage(
      name: Routes.VETIFICATION,
      page: () => const Verification(),
    ),
    GetPage(
      name: Routes.LOG_IN,
      page: () => const Login(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SingUp(),
      binding: SingUpBinding(),
    ),
    GetPage(
      name: Routes.SELECT_LOCATION,
      page: () => const SelectLocation(),
      binding: SelectLocationBinding(),
      arguments:  String,
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeSrc(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetail(),
      arguments: Product,
    ),
    GetPage(
      name: Routes.EXPLORE,
      page: () => const FindProducts(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const Search(),
    ),
    GetPage(
      name: Routes.BEVERAGES,
      page: () => const Beverages(),
    ),
    GetPage(
      name: Routes.FILTERS,
      page: () => const Filters(),
    ),
    GetPage(
      name: Routes.MY_CART,
      page: () => const MyCart(),
    ),
    GetPage(
      name: Routes.FAVORITES,
      page: () => const Favorites(),
    ),
    GetPage(
      name: Routes.ORDER_ACCEPTED,
      page: () => const OrderAccepted(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const Account(),
    ),

  ];
}