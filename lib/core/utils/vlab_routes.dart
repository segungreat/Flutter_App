import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VlabAppRoutes {
  static final routes = <String, Widget Function()>{};

  static List<GetPage> get getPages => routes.entries.map((entry) {
    return GetPage(name: entry.key, page: entry.value, transition: Transition.native);
  }).toList();
}
