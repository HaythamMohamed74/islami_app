// provider sebha
import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  late int turns = 0;
  late double parcent = 0.0;
  late int counter = 0;
  int? value;
  Future<void> tabOnTasbeh() async {
    counter = (counter + 1) % 33;
    await tuensCalc();
    parcent = counter < 33 ? counter / 33.0 : 0.0;
    notifyListeners();
  }

  Future<void> tuensCalc() async {
    value = turns;
    if (counter % 33 == 0) {
      int turns1 = (counter ~/ 33) + 1;
      turns = turns1 + value!;
    }
    notifyListeners();
  }

  void resetAll() {
    turns = 0;
    counter = 0;
    parcent = 0;
    notifyListeners();
  }
}
//
//save counter in shared and share it in turns method
// late Future<SharedPreferences> _preferences = await SharedPreferences();
