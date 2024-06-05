import 'package:flutter/material.dart';
import 'dart:math';

Color primaryColor() => Color(0xFFADBC9F);
Color secondaryColor() => Color(0xFF747264);
whiteColor() => Colors.white;
blackColor() => Colors.black;
greyColor() => Colors.grey;
customBoxShadow() =>
    [BoxShadow(blurRadius: 2, offset: Offset(-2, -2), color: secondaryColor())];

Color randomColors() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
