import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';

import '../models/product.dart';

class UserRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<QuerySnapshot> readRealTime() {
    Stream<QuerySnapshot> stream =
        db.collection(Collections.USERS).snapshots();
    return stream;
  }
}
