import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart'; // Import velocity_x for styling
// Remove or comment out the following line
// import 'package:flutter_box/flutter_box.dart'; // Import flutter_box for layout adjustments

Widget homeButtons({width, height, String? icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon!, width: 16),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
