import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() =>
      _box.read(_key) ??
      false; //?? means if key is not minus return false otherwise true. here it will be true.
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemToBox(!_loadThemeFromBox());
  }
}

