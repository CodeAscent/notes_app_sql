import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sql/controllers/drawer_controller.dart';
import 'package:notes_app_sql/controllers/show_fav_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

initControllers() {
  Get.put(DrawerCustomController());
  Get.put(ShowFavouriteController());
}

initThemeController() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.getBool("isDarkTheme") ?? false
      ? Get.changeThemeMode(ThemeMode.dark)
      : Get.changeThemeMode(ThemeMode.light);
}
