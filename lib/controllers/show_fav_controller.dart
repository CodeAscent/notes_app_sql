import 'package:get/get.dart';

class ShowFavouriteController extends GetxController {
  RxBool showFav = false.obs;
  showfavourite() {
    showFav.value = true;
    update();
  }

  showHome() {
    showFav.value = false;
    update();
  }
}
