import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';

import '../models/product.dart';

class ProductRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<DocumentReference> add(Product product) {
    Future<DocumentReference> future =
        db.collection(Collections.PRODUCTS).add(product.toJSON());
    return future;
  }
}
