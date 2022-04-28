// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../modules/models/product.dart';
// import '../modules/repository/product_repo.dart';
// import '../utils/widgets/custom_text.dart';
// import '../utils/widgets/toast.dart';

// class add_product extends StatefulWidget {
//   const add_product({Key? key}) : super(key: key);

//   @override
//   State<add_product> createState() => _add_productState();
// }

// class _add_productState extends State<add_product> {
//   TextEditingController nameCtrl = TextEditingController();
//   TextEditingController descCtrl = TextEditingController();
//   TextEditingController qtyCtrl = TextEditingController();
//   TextEditingController priceCtrl = TextEditingController();
//   double priceValue = 1;
//   _addProduct() {
//     String name = nameCtrl.text;
//     String desc = descCtrl.text;
//     double qty = double.parse(qtyCtrl.text);
//     Product product = Product.takeProduct(
//         name: name, desc: desc, price: priceValue, qty: qty);
//     ProductRepository product_repo = ProductRepository();
//     Future<DocumentReference> future = product_repo.add(product);
//     future.then((value) {
//       createToast('Product Successfully Added', ctx);
//       Future.delayed(Duration(seconds: 1), () {
//         nameCtrl.clear();
//         descCtrl.clear();
//         qtyCtrl.clear();
//         priceCtrl.clear();
//         priceValue = 1;
//         setState(() {});
//       });
//     }).catchError((err) {
//       print("Error is $err");
//       createToast('Product was not Added', ctx);
//     });
//   }

//   late BuildContext ctx;
//   @override
//   Widget build(BuildContext context) {
//     this.ctx = context;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Text('ADD PRODUCT', style: TextStyle(fontSize: 40)),
//           CustomText(
//               label: 'Type Name Here',
//               tc: nameCtrl,
//               prefixIcon: Icons.text_snippet),
//           CustomText(
//             label: 'Type Description Here',
//             tc: descCtrl,
//             isMultiLine: true,
//             prefixIcon: Icons.text_snippet,
//           ),
//           Slider(
//               min: 1,
//               max: 10000,
//               value: priceValue,
//               onChanged: (currentValue) {
//                 priceValue = currentValue;
//                 priceCtrl.text = priceValue.toStringAsFixed(2);
//                 setState(() {});
//               }),
//           Container(
//             margin: EdgeInsets.only(left: 10, right: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [Text("₹1"), Text("₹100000")],
//             ),
//           ),
//           //Image Upload
//           CustomText(label: "Price", tc: priceCtrl, prefixIcon: Icons.money),
//           CustomText(
//             label: 'Type Quantity Here',
//             tc: qtyCtrl,
//             prefixIcon: Icons.production_quantity_limits,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 _addProduct();
//               },
//               child: Text('ADD PRODUCT'))
//         ],
//       ),
//     );
//   }
// }
