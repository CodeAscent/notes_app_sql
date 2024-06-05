import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:notes_app_sql/constants/app_theme.dart';
import 'package:notes_app_sql/controllers/init_controllers.dart';
import 'package:notes_app_sql/routes/getx_routes.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initControllers();
    initThemeController();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme(),
      darkTheme: darkAppTheme(),
      title: "Quicky Notes",
      initialRoute: "/",
      getPages: getPages,
    );
  }
}
