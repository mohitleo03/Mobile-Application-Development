import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_seller_app/modules/models/product.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';
import 'package:shopping_seller_app/utils/helpers/upload.dart';
import 'package:shopping_seller_app/utils/widgets/custom_text.dart';
import 'package:shopping_seller_app/utils/widgets/toast.dart';

class AddPrduct extends StatelessWidget {
  late Function refreshChild;
  AddPrduct(this.refreshChild);
  String? fileName = "";
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  double priceValue = 1;
  _addProduct() {
    String name = nameCtrl.text;
    String desc = descCtrl.text;
    double qty = double.parse(qtyCtrl.text);
    Product product = Product.takeProduct(
        name: name, desc: desc, price: priceValue, qty: qty);
    ProductRepository product_repo = ProductRepository();
    Future<DocumentReference> future = product_repo.add(product);
    future
        .then((value) => createToast('Product Successfully Added', ctx))
        .catchError((err) {
      print("Error is $err");
      createToast('Product was not Added', ctx);
    });
  }

  final ImagePicker _picker = ImagePicker();

  _uploadIt() {
    UploadDownload obj = UploadDownload();
    UploadTask upload = obj.uploadImage(fileName!);
    upload.then((TaskSnapshot shot) async {
      String URL = await obj.ref.getDownloadURL();
      print("Download URL " + URL);
    }).catchError((err) {});
  }

  _showCameraOrGallery() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            await _showCamera();
            refreshChild();
            _uploadIt();
          },
          child: Text("Image by Camera"),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            _showGallery();
          },
          child: Text("Image by Gallery"),
        ),
      ],
    );
  }

  _showCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    fileName = photo?.path;
    print(fileName);
  }

  _showGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }

  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    print(fileName);
    this.ctx = context;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('ADD PRODUCT', style: TextStyle(fontSize: 40)),
          CustomText(
              label: 'Type Name Here',
              tc: nameCtrl,
              prefixIcon: Icons.text_snippet),
          CustomText(
            label: 'Type Description Here',
            tc: descCtrl,
            isMultiLine: true,
            prefixIcon: Icons.text_snippet,
          ),
          Slider(
              value: priceValue,
              onChanged: (currentValue) {
                priceValue = currentValue;
              }),
          //Image Upload
          CustomText(
            label: 'Type Quantity Here',
            tc: qtyCtrl,
            prefixIcon: Icons.production_quantity_limits,
          ),
          _showCameraOrGallery(),
          fileName == ""
              ? Text("Choose File To Upload")
              : Container(
                  width: 150, child: Image.file(File(fileName.toString()))),
          ElevatedButton(
              onPressed: () {
                _addProduct();
              },
              child: Text('ADD PRODUCT'))
        ],
      ),
    );
  }
}
