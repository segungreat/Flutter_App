import 'package:flutter/material.dart';

//this removes the glow effect in list views
class CustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
