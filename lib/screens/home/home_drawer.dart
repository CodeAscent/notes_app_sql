import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app_sql/controllers/drawer_controller.dart';
import 'package:notes_app_sql/controllers/show_fav_controller.dart';
import 'package:notes_app_sql/shared/theme_bool.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerController = Get.find<DrawerCustomController>();
    final showFavController = Get.find<ShowFavouriteController>();

    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Lottie.asset(
                  'assets/lottie/lottie_snail.json',
                ),
              ),
              ListTile(
                onTap: () {
                  showFavController.showHome();
                  drawerController.getDrawerController().hideDrawer();
                },
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () {
                  showFavController.showfavourite();
                  drawerController.getDrawerController().hideDrawer();
                },
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();

                  await ThemeBool().toogleTheme();
                  await sharedPreferences.getBool("isDarkTheme") ?? false
                      ? Get.changeThemeMode(ThemeMode.dark)
                      : Get.changeThemeMode(ThemeMode.light);
                  drawerController.getDrawerController().hideDrawer();
                },
                leading: Icon(Icons.theater_comedy),
                title: Text('Change Theme'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
