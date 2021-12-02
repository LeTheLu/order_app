import 'package:get/get.dart';
import 'package:order_app/binding/first_home_bindings.dart';
import 'package:order_app/binding/select_location.dart';
import 'package:order_app/binding/singup_binding.dart';
import 'package:order_app/page/first_home/first_home.dart';
import 'package:order_app/page/home/home_src.dart';
import 'package:order_app/page/login/login.dart';
import 'package:order_app/page/number/number.dart';
import 'package:order_app/page/onbording/onbording.dart';
import 'package:order_app/page/product_detail/product_detail.dart';
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
    ),

  ];
}