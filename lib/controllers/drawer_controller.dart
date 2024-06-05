import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class DrawerCustomController extends GetxController {
  final _advancedDrawerController = AdvancedDrawerController().obs;

  getDrawerController() {
    return _advancedDrawerController.value;
  }
}
