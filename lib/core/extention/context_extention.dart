import 'package:flutter/material.dart';

extension NavigatorExtention on BuildContext {
  navigatorPush(Widget screen) {
    Navigator.push(
        this, MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  navigatorPop() {
    Navigator.pop(this);
  }
}
