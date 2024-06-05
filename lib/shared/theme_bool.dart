import 'package:shared_preferences/shared_preferences.dart';

class ThemeBool {
  toogleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool theme = await getTheme();
    sharedPreferences.setBool("isDarkTheme", !theme);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getBool("isDarkTheme") == null) {
      return false;
    }
    return sharedPreferences.getBool("isDarkTheme");
  }
}
