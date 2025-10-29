import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VlabNav<T> {
 
  static void removeUntilNamed(String route) {
    Get.offAllNamed(route);
  }

  static void goBack<T>({T? result}) {
    Get.back(
      result: result,
    );
  }

    static void toNamed(String route,
      {dynamic arguments, Function(dynamic)? onResult}) {
    Get.toNamed(
      route,
      arguments: arguments,
    )?.then((result) {
      if (onResult != null) {
        onResult(result);
      }
    });
  }

  static void off(Widget page) {
    Get.off(
      () => page,
      transition: Transition.cupertino,
    );
  }

  static void offNamed(String route, {dynamic arguments}) {
    Get.offNamed(
      route,
      arguments: arguments,
      
    );
  }
}
