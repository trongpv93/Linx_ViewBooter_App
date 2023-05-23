import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:view_booters/routes/app_pages.dart';
import 'package:view_booters/routes/app_routes.dart';
import 'package:view_booters/ui/splash/splash_page.dart';
import 'package:view_booters/ui/utils/app_color.dart';

import 'bindings/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'MedOn for Doctor',
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
        debugShowCheckedModeBanner: false,
        enableLog: true,
        defaultTransition: Transition.cupertino,
        home: SplashPage(),
        initialRoute: AppRoutes.SPLASH_PAGE,
        initialBinding: AppBinding(),
        getPages: AppPages.pages,
        locale: Locale('vn', 'VI'),
        builder: EasyLoading.init(),
        routingCallback: (value) {
          // Here you can check which screen your app is currently on
          SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(statusBarColor: Colors.transparent));
        },
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
