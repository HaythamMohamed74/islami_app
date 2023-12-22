// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedHelper {
//   static late SharedPreferences sharedPreferences;
//
//   init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static const String key = 'counter';
//
//   Future<int> getValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int value = prefs.getInt(key) ?? 0;
//     return value;
//   }
//
//   Future<void> setValue({required int value}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(key, value);
//   }
// }
