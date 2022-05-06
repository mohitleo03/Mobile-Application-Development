import 'package:flutter/animation.dart';

void main(List<String> args) {
  //takeOrder(); //after 2 sec
  giveData();
}

giveData() {
  Stream st = Stream.periodic(Duration(seconds: 2), (int value) {
    print("Value is $value");
  });
  st.listen((data) {
    print("Listen the data $data");
  }, onError: (err) {
    print("Error is $err");
  }, onDone: () {
    print("Done...");
  });
}

takeOrder() {
  Future.delayed(Duration(seconds: 2), () {
    print("Order Booked...");
  });
}
