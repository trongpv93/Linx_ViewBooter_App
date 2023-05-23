import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../profile_page.dart';

class AppProfilesPages {
  static final pages = [
    GetPage(name: AppRoutes.PROFILE_PAGE, page: () => ProfilePage()),
  ];
}
