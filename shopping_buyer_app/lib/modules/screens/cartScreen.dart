import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_buyer_app/config/constants/AppConstants.dart';
// import 'package:shopping_seller_app/config/constants/AppConstants.dart';

class CartScreen2 extends StatefulWidget {
  const CartScreen2({Key? key}) : super(key: key);

  @override
  State<CartScreen2> createState() => _CartScreen2State();
}

class _CartScreen2State extends State<CartScreen2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  read(Function getCartList, Function getError) {
    // print("object");
    Future<QuerySnapshot> snapshot = firestore
        .collection(Collections.CART + "/123asdwqdasdasd/orderlist")
        .get();
    snapshot
        .then((value) => getCartList(value))
        .catchError((onError) => getError(onError));
  }

  List<dynamic> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    read(getCartList, getError);
  }

  getCartList(QuerySnapshot snapshot) {
    list = snapshot.docs;
    setState(() {});
  }

  getError(dynamic err) {
    print("error is $err");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: list.length == 0
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    var doc = list[index].data();
                    double price = doc['price'];
                    return ListTile(
                        subtitle: Text(doc['quantity'].toString()),
                        title: Text(doc["name"]),
                        trailing:
                            Text(price.toStringAsFixed(2)),
                        leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(doc['url'])));
                  })),
        ));
  }
}
