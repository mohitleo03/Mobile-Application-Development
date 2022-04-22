import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/models/product.dart';
import 'package:shopping_seller_app/modules/widgets/custom_text.dart';

class AddPrduct extends StatelessWidget {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  double price = 1;
  _addProduct() {
    product addProduct = product.takeInput(
        productName: nameCtrl.text,
        productDesc: descCtrl.text,
        produtPrice: price,
        productQty: int.parse(qtyCtrl.text));
    print(addProduct);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('ADD PRODUCT', style: TextStyle(fontSize: 40)),
          CustomText(label: 'Type Name Here', tc: nameCtrl),
          CustomText(
            label: 'Type Description Here',
            tc: descCtrl,
            isMultiLine: true,
          ),
          Slider(
              value: 1,
              onChanged: (currentValue) {
                price = currentValue;
              }),
          //Image Upload
          CustomText(label: 'Type Quantity Here', tc: qtyCtrl),
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
