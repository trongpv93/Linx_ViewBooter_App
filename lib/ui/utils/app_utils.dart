import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import './app_constants.dart';
import 'Tlog.dart';
import 'app_color.dart';

class AppUtils {
  static final GetStorage storage = GetStorage();

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static remove(String key) {
    try {
      storage.remove(key);
    } catch (e) {}
  }

  static isFirstTimeOpenApp() {
    try {
      if (storage.read(AppConstants.KFirstTimeOpenApp) != null &&
          storage.read(AppConstants.KFirstTimeOpenApp) == true) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static saveFirstTimeOpenApp() {
    return storage.write(AppConstants.KFirstTimeOpenApp, true);
  }

  static showBasicDialog({
    context,
    required Widget content,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return content;
        });
  }

  static showBottomActionSheet(
      {required Widget child, bool dismissOnBackgroundTouch = true}) async {
    await Get.bottomSheet(
      child,
      ignoreSafeArea: true,
      isDismissible: dismissOnBackgroundTouch,
    );
  }

  static void showToast(String message) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppColors.appGray1Color,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  //for loading
  static showLoading() {
    EasyLoading.show(dismissOnTap: false);
  }

  static showLoadingProgress(double progress) {
    EasyLoading.showProgress(progress,
        status: "${(progress * 100).toStringAsFixed(0)}%");
  }

  static hideLoading() {
    EasyLoading.dismiss();
  }

  //save preference
  //Using Getx
  static String getString(String key) {
    String result = "";
    try {
      var stringValue = storage.read(key);
      if (stringValue != null) result = stringValue;
    } catch (ex) {
      Tlog.logError("Storage get data from key $key not found");
    }
    return result;
  }

  static void saveString(String key, String value) async {
    storage.write(key, value);
  }

  static bool getBool(String key) {
    bool result = false;
    try {
      var val = storage.read(key);
      if (val != null) result = val;
    } catch (ex) {
      Tlog.logError("Storage get data from key $key not found");
    }
    return result;
  }

  static void saveBool(String key, bool value) async {
    storage.write(key, value);
  }

  //for date convert
  static String dateTimeToStringFormat(DateTime? date,
      {String? format = AppConstants.ddMMyyyy}) {
    String val = '';
    if (date != null) {
      if (format == null || format.length == 0) {
        format = AppConstants.ddMMyyyy;
      }
      try {
        val = DateFormat(format).format(date);
      } catch (er) {}
    }
    return val;
  }

  //device info
  static Future<String> getDeviceId() async {
    var deviceId = '';
    // var deviceInfo = DeviceInfoPlugin();
    // if (Platform.isIOS) {
    //   // import 'dart:io'
    //   var iosDeviceInfo = await deviceInfo.iosInfo;
    //   deviceId = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    // } else {
    //   var androidDeviceInfo = await deviceInfo.androidInfo;
    //   deviceId = androidDeviceInfo.androidId; // unique ID on Android
    // }
    return deviceId;
  }

  static String getPlatformString() {
    if (Platform.isIOS)
      return 'ios';
    else
      return 'android';
  }

  static Future<String> getAppVersion() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    return "";
  }

  static getOSVersion() {
    return Platform.operatingSystemVersion;
  }
}
