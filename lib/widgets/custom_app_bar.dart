import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sql/controllers/drawer_controller.dart';

class CustomAppBar extends StatelessWidget {
  final String label;
  final bool showLeading;
  final List<Widget>? action;
  const CustomAppBar({
    super.key,
    required this.label,
    required this.showLeading,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final drawerController = Get.find<DrawerCustomController>();

    return AppBar(
      leading: showLeading
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.navigate_before))
          : IconButton(
              onPressed: () {
                drawerController.getDrawerController().showDrawer();
              },
              icon: Icon(Icons.draw_rounded)),
      title: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
      actions: action,
    );
  }
}
