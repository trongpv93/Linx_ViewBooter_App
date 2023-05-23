import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../splash_page.dart';

part './route.dart';

class AppSplashPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH_PAGE, page: () => SplashPage()),
  ];
}
