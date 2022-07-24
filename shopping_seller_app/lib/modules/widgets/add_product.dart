import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_seller_app/modules/models/product.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';
import 'package:shopping_seller_app/utils/services/upload.dart';
import 'package:shopping_seller_app/utils/widgets/custom_text.dart';
import 'package:shopping_seller_app/utils/widgets/toast.dart';

class AddPrduct extends StatefulWidget {
  Function refreshChild;
  Function switchChild;
  int flag;
  AddPrduct(this.refreshChild, this.switchChild, this.flag) {}

  @override
  State<AddPrduct> createState() => _AddPrductState();
}

class _AddPrductState extends State<AddPrduct> {
  late String URL;

  String? fileName;

  TextEditingController nameCtrl = TextEditingController();

  TextEditingController descCtrl = TextEditingController();

  TextEditingController qtyCtrl = TextEditingController();

  TextEditingController categoryCtrl = TextEditingController();

  double priceValue = 1;

  _addProduct() {
    String name = nameCtrl.text;
    String desc = descCtrl.text;
    double qty = double.parse(qtyCtrl.text);
    String category = categoryCtrl.text;
    Product product = Product.takeProduct(
        name: name,
        desc: desc,
        price: priceValue,
        qty: qty,
        url: URL,
        category: category);
    ProductRepository product_repo = ProductRepository();
    Future<DocumentReference> future = product_repo.add(product);

    future.then((value) {
      createToast('Product Successfully Added', ctx);
      Future.delayed(Duration(seconds: 2), () {
        nameCtrl.clear();
        descCtrl.clear();
        qtyCtrl.clear();
        categoryCtrl.clear();
        priceValue = 1;
        fileName = null;
        widget.switchChild();
      });
    }).catchError((err) {
      print("Error is $err");
      createToast('Product was not Added', ctx);
    });
  }

  final ImagePicker _picker = ImagePicker();

  _uploadIt() {
    UploadDownload obj = UploadDownload();
    UploadTask upload = obj.uploadImage(fileName!);
    upload.then((TaskSnapshot shot) async {
      URL = await obj.ref.getDownloadURL();
      print("Download URL " + URL);
    }).catchError((err) {});
  }

  _showCameraOrGallery(Size deviceSize) {
    return Container(
      width: deviceSize.width / 1.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: 50,
                  onPressed: () async {
                    await _showCamera();
                    // refreshChild();
                    _uploadIt();
                  },
                  icon: Icon(Icons.camera)),
              IconButton(
                  iconSize: 50,
                  onPressed: () async {
                    await _showGallery();
                    // refreshChild();
                    _uploadIt();
                  },
                  icon: Icon(Icons.folder)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Camera   "), Text("Gallery ")],
          )
        ],
      ),
    );
  }

  _showCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    fileName = photo?.path;
    print("File name is $fileName");
    // refreshChild();
  }

  _showGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    fileName = image?.path;
    print("File name is $fileName");
    // refreshChild();
  }

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    ctx = context;
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
          CustomText(
            label: 'Type Category Here',
            tc: categoryCtrl,
            prefixIcon: Icons.text_snippet,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("0"), Text("80,000")],
            ),
          ),
          Slider(
              value: priceValue,
              max: 80000,
              min: 1,
              onChanged: (currentValue) {
                priceValue = currentValue;
                setState(() {});
              }),
          Center(
            child: Text(
              "Price : ${priceValue.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          //Image Upload
          CustomText(
            label: 'Type Quantity Here',
            tc: qtyCtrl,
            prefixIcon: Icons.production_quantity_limits,
            isDigitInput: true,
          ),
          _showCameraOrGallery(deviceSize),
          SizedBox(height: 15),
          fileName == null
              ? Text("Choose File To Upload")
              : Container(
                  width: 150, child: Image.file(File(fileName.toString()))),
          SizedBox(height: 15),
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
