import 'package:cloud_firestore/cloud_firestore.dart';
import '/config/constants/AppConstants.dart';

import '../models/product.dart';

class ProductRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<DocumentReference> add(Product product) {
    Future<DocumentReference> future =
        db.collection(Collections.PRODUCTS).add(product.toJSON());
    return future;
  }

  // read(Function getProducts, Function getError) {
  //   //get products from database
  //   // QuerySnapshot<Map<String, dynamic>> products =
  //   Future<dynamic> future = db.collection(Collections.PRODUCTS).get();
  //   future.then((products) {
  //     List<dynamic> Products = products.docs
  //         .map((element) => Product.fromJSON(element.data()))
  //         .toList();
  //     // print(Products);
  //     getProducts(Products);
  //   }).catchError((err) => {getError(err)});
  // }

  Future<List<Product>> read() async {
    QuerySnapshot querySnapshot =
        await db.collection(Collections.PRODUCTS).get(); //read all the products
    List<QueryDocumentSnapshot> list = querySnapshot.docs;
    List<Product> products =
        list.map((QueryDocumentSnapshot doc) => Product.fromJSON(doc)).toList();
    return products;
  }

  Stream<QuerySnapshot> readRealTime() {
    Stream<QuerySnapshot> stream =
        db.collection(Collections.PRODUCTS).snapshots();
    return stream;
  }
  // Future<dynamic> readByAwait() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> products =
  //         await db.collection(Collections.PRODUCTS).get();
  //     print(products.docs[1].data());
  //     List<Product> Products = products.docs
  //         .map((element) => Product.fromJSON(element.data()))
  //         .toList();
  //     return Products;
  //   } catch (err) {
  //     return err;
  //   }
  // }

  // Future<dynamic> update(Product product) async {
  //   try {
  //     await db.doc(product.id).update(product.toJSON());
  //   } catch (err) {
  //     return err;
  //   }
  // }

  Future<dynamic> delete(Product product) async {
    try {
      await db.collection(Collections.PRODUCTS).doc(product.id).delete();
    } catch (err) {
      return err;
    }
  }
}
