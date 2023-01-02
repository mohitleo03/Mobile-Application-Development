import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app_color.dart';
import 'package:food_app/utils/screen_dimensions.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/expandable_text.dart';
import 'package:food_app/utils/long_text_item.dart';

import '../../widgets/big_text_widgets.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text_widget.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background Image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: ScreenDimension.popularFoodImageSize,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  image: const DecorationImage(
                    image: AssetImage(
                      'images/first_food.png',
                    ),
                  ),
                ),
              ),
            ),
            // Two top icons
            Positioned(
              left: ScreenDimension.width20,
              right: ScreenDimension.width20,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                  ],
                ),
              ),
            ),
            // introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: ScreenDimension.popularFoodImageSize - 30,
              child: Container(
                padding: EdgeInsets.only(
                  left: ScreenDimension.width20,
                  right: ScreenDimension.width20,
                  top: ScreenDimension.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(ScreenDimension.radius20),
                    topLeft: Radius.circular(ScreenDimension.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: 'Nigerian Fries',
                    ),
                    SizedBox(
                      height: ScreenDimension.height20,
                    ),
                    BigText(
                      text: 'Introduce',
                    ),

                    SizedBox(height: ScreenDimension.height20),
                    // Expandable Text Widget
                    Expanded(
                      child: SingleChildScrollView(
                        child:
                            ExpandableText(text: LongTextItem.collapsibleText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: ScreenDimension.bottomBarHeight,
          padding: EdgeInsets.only(
            top: ScreenDimension.height30,
            bottom: ScreenDimension.height30,
            left: ScreenDimension.width20,
            right: ScreenDimension.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgrounColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenDimension.radius20 * 2),
              topRight: Radius.circular(
                ScreenDimension.radius20 * 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenDimension.radius20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                      SizedBox(
                        width: ScreenDimension.width10 / 2,
                      ),
                      BigText(
                        text: '0',
                      ),
                      SizedBox(
                        width: ScreenDimension.width10 / 2,
                      ),
                      Icon(Icons.add, color: AppColors.signColor),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenDimension.radius20),
                  color: AppColors.mainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:
                      BigText(text: '₦730 | Add to cart', color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
