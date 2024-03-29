import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts.dart';
import 'package:flutter_application_1/consts/loadingIndicator.dart';
import 'package:flutter_application_1/services/firestore_services.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:
            "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getWishlist(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Order yet!".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                data[index]['p_images'][0].toString())),
                        title: "${data[index]['product_name']}"
                            .text
                            .fontFamily(semibold)
                            .size(16)
                            .make(),
                        subtitle: "${data[index]['p_price']}"
                            .numCurrency
                            .text
                            .color(redColor)
                            .fontFamily(semibold)
                            .make(),
                        trailing: const Icon(Icons.favorite, color: redColor)
                            .onTap(() async {
                          await firestore
                              .collection(productCollections)
                              .doc(data[index].id)
                              .set({
                            'p_wishlist':
                                FieldValue.arrayRemove([currentUser!.uid]),
                          }, SetOptions(merge: true));
                        }),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
