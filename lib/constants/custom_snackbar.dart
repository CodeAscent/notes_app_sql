import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app_sql/constants/app_colors.dart';

customSnackbar({required String message}) {
  if (!Get.isSnackbarOpen)
    Get.snackbar("Message", message,
        backgroundColor: secondaryColor(),
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        boxShadows: customBoxShadow(),
        titleText: Row(
          children: [
            Text(
              "Message",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            Lottie.asset(
              "assets/lottie/lottie_snail.json",
              height: 40,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10));
}
