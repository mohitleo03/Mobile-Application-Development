import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/app_color.dart';
import 'package:food_app/widgets/big_text_widgets.dart';
import 'package:food_app/widgets/small_text_widget.dart';

import '../../utils/screen_dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenDimension.height20),
              margin: EdgeInsets.only(
                top: ScreenDimension.width20,
                bottom: ScreenDimension.width10,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'North Korea',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'City',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        //coming back to optimize
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ScreenDimension.radius15),
                            color: AppColors.mainColor),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: ScreenDimension.iconSize24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: const FoodPageBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
