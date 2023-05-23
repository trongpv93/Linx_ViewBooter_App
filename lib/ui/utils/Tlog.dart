import 'package:flutter/foundation.dart';

class Tlog {
  Tlog(String s);

  static void logInfo(dynamic message) {
    // logger.i(message);
    printMessage(message);
  }

  static logError(dynamic message) {
    // logger.e(message);

    printMessage(message);
  }

  static logWarning(dynamic message) {
    // loggerNoStack.w(message);

    printMessage(message);
  }

  static log(dynamic message) {
    // loggerNoStack.d(message);

    printMessage(message);
  }

  static printMessage(dynamic message) {
    // if (kDebugMode) {
    //   print(message);
    // }

    //build release thì bỏ đi
    print(message);
  }
}
