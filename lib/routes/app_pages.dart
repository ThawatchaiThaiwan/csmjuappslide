import 'package:appcsmju/Homebinding/home_binding.dart';
import 'package:appcsmju/footbar/Home.dart';

import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/page/Appeal.dart';
import 'package:appcsmju/page/login_page.dart';

import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      // ignore: non_constant_identifier_names
      page: () => LoginPage(),
      binding: HomeBinding(),
      
      
    ),
  ];
}
