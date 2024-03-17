import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/styles.dart';
import 'package:flutter_application_1/widgets_same/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialoge(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "conform".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure want to exit?..".text.size(16).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                onpress: () {
                  SystemNavigator.pop();
                },
                color: redColor,
                textColor: whiteColor,
                title: "Yes",
                onPress: () {}),
            ourButton(
                onpress: () {
                  Navigator.pop(context);
                },
                color: redColor,
                textColor: whiteColor,
                title: "No",
                onPress: () {})
          ],
        ),
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}
