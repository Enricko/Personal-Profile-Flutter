import 'package:get/get.dart';

import '../pages/homepage.dart';

class RouteList {
  static final pages = [
    GetPage(
      name: "/",
      page: () => HomePage(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: "/about_us",
      page: () => HomePage(),
      binding: BindingsBuilder(() {}),
    ),
  ];
}
