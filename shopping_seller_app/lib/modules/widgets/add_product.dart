import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/custom_text.dart';

class AddPrduct extends StatelessWidget {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(label: 'Type Name Here', tc: nameCtrl),
        CustomText(label: 'Type Description Here', tc: descCtrl, isMultiLine: true,),
        Slider(value: 1, onChanged: (currentValue){

        }),
        //Image Upload
        CustomText(label: 'Type Quantity Here', tc: qtyCtrl)
      ],
    );
  }
}