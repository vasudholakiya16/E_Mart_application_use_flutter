import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/consts/strings.dart';
import 'package:flutter_application_1/consts/styles.dart';
import 'package:flutter_application_1/views/cart_screen/cart_screen.dart';
import 'package:flutter_application_1/views/category_card/category_screen.dart';
import 'package:flutter_application_1/views/controller/home_controller.dart';
import 'package:flutter_application_1/views/home_screen/home_screen.dart';
import 'package:flutter_application_1/views/profile_screen/profile_screen.dart';
import 'package:flutter_application_1/widgets_same/exit_Diloge.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    var Controller = Get.put(HomeContainer());
    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26.0,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26.0,
        ),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26.0,
        ),
        label: Cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26.0,
        ),
        label: account,
      ),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialoge(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(Controller.CurrentNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: Controller.CurrentNavIndex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarItem,
            // Add the 'navbarItem' list here
            onTap: (value) {
              Controller.CurrentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
