import 'package:fcm_app/page/home1_page.dart';
import 'package:fcm_app/page/home2_page.dart';
import 'package:fcm_app/page/home_page.dart';
import 'package:get/get.dart';

import 'app_routers.dart';

class Routers {
  static final route = [
    GetPage(
      name: AppRouters.root,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRouters.home1,
      page: () => const Home1Page(),
    ),
    GetPage(
      name: AppRouters.home2,
      page: () => const Home2Page(),
    ),
  ];
}
