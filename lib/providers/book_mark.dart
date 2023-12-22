import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_strings.dart';

class BookMarkProvider with ChangeNotifier {
  late SharedPreferences _preferences;
  int bookmarkedPage = 0;

  Future<void> initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    bookmarkedPage = _preferences.getInt(AppStrings.keyTwo) ?? 0;
    notifyListeners();
  }

  bool isBookmarked(int page) {
    return bookmarkedPage == page;
  }

  void toggleBookmark(int page) {
    String key = AppStrings.keyOne(page);
    if (_preferences.containsKey(key)) {
      _preferences.remove(key); // Remove bookmark if it exists
      if (page == bookmarkedPage) {
        bookmarkedPage = 0; // Clear bookmarkedPage if removed
      }
    } else {
      _preferences.setBool(key, true);
      _preferences.setInt(
          AppStrings.keyTwo, page); // Save bookmark for the page
      bookmarkedPage = page; // Set the current bookmarkedPage
    }
    notifyListeners();
  }
}
