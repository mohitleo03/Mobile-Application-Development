import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_buyer_app/modules/models/cartItem.dart';
import '/modules/repository/product_repo.dart';

import '../models/product.dart';

class ViewProduct extends StatelessWidget {
  ProductRepository repo = ProductRepository();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Product product;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        child: StreamBuilder(
            stream: repo.readRealTime(),
            builder:
                ((BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              ConnectionState state = snapshot.connectionState;
              if (state == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                print("Error is ...");
                print(snapshot.error);
                return Center(
                  child: Text('Some error in retrieving products'),
                );
              } else {
                return ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    var doc = snapshot.data!.docs[index].data();
                    product = Product.fromMap(doc,snapshot.data!.docs[index].id);
                    return ListTile(
                        leading: Container(
                            width: deviceSize.width / 5.2,
                            child: Image.network(product.url)),
                        title: Text(product.name),
                        // subtitle: Text(snapshot.data![index].desc),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.desc),
                            Text("Quantity : ${product.qty}")
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, //without this it takes main axis size as size which overflow and gives error
                          children: [
                            IconButton(
                                onPressed: () {
                                  product = Product.fromMap(
                                          doc, snapshot.data!.docs[index].id);
                                      addProductToCart(
                                          snapshot.data!.docs[index].id,
                                          product.price,
                                          product.url,
                                          product.name,
                                          "123asdwqdasdasd");
                                  
                                }, icon: Icon(Icons.add_circle_outline_sharp)),
                            IconButton(
                                onPressed: () {
                                  //delete the product
                                },
                                icon: Icon(
                                  Icons.money,
                                  color: Colors.red,
                                ))
                          ],
                        ));
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }
            })));
  }
  void addProductToCart(
      String id, double price, String url, String name, String s) {
    getPreviousCount(id, price, url, name, s);
  }


  void getPreviousCount(
      String id, double price, String url, String name, String s) async {
    try {
      DocumentReference querySnapshot =
          await firestore.collection("cart").doc(s)
      .collection('orderlist')
      .doc(id);

      querySnapshot.get().then((DocumentSnapshot doc) {
        if (doc.exists) {
          int valueToUpdate = int.parse(doc.get('quantity').toString()) + 1;
          lol(id, valueToUpdate, price, url, name, s);
        } else {
          lol(id, 1, price, url, name, s);
        }
      });
    } catch (e) {
      // lol(id, 1, s);
    }
  }

  void lol(String id, int valueToTupdate, double price, String url, String name,
      String s) {
    try {
      Future<void> red = firestore.collection('cart').doc(s).set({"userid": s});
      // print("eskhejwghgesfggesijsebfhjfaeyfewdhjbewFJKBfewigfkjfejk");
      // print(price);
      print(CartItem(id, valueToTupdate, price, url, name).toJSON());
      Future<void> red2 = firestore
          .collection('cart')
          .doc(s)
          .collection('orderlist')
          .doc(id)
          .set(CartItem(id, valueToTupdate, price, url, name)
              .toJSON());
      print(red);
    } catch (e) {
      print(e);
    }
  }
}

  // Widget build(BuildContext context) {
  //   Size deviceSize = MediaQuery.of(context).size;
  //   ProductRepository repo = ProductRepository();
  //   return Container(
  //     child: FutureBuilder(
  //       future: repo.read(), //Firebase read operation, which give future
  //       builder: (BuildContext ctx, AsyncSnapshot<List<Product>> snapshot) {
  //         ConnectionState state = snapshot.connectionState;
  //         if (state == ConnectionState.waiting) {
  //           //loading
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else if (snapshot.hasError) {
  //           print("Error is ...");
  //           print(snapshot.error);
  //           return Center(
  //             child: Text('Some error in retrieving products'),
  //           );
  //         } else {
  //           //it has data
  //           return ListView.builder(
  //             itemBuilder: (BuildContext ctx, int index) {
  //               return ListTile(
  //                   leading: Container(
  //                       width: deviceSize.width / 5.2,
  //                       child: Image.network(snapshot.data![index].url)),
  //                   title: Text(snapshot.data![index].name),
  //                   // subtitle: Text(snapshot.data![index].desc),
  //                   subtitle: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(snapshot.data![index].desc),
  //                       Text("Quantity : ${snapshot.data![index].qty}")
  //                     ],
  //                   ),
  //                   trailing: Row(
  //                     mainAxisSize: MainAxisSize.min,//without this it takes main axis size as size which overflow and gives error
  //                     children: [
  //                       IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
  //                       IconButton(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.delete,
  //                             color: Colors.red,
  //                           ))
  //                     ],
  //                   )
  //                   );
  //             },
  //             itemCount: snapshot.data!.length,
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

