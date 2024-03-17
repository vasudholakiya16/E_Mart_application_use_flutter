import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/consts/firebase_constent.dart';
import 'package:get/get.dart';

class HomeContainer extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var CurrentNavIndex = 0.obs;
  var username = '';
  var searchController = TextEditingController();
  getUsername() async {
    var n = await firestore
        .collection(userCollections)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    // print(username);
  }
}
