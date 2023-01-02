import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app_color.dart';
import 'package:food_app/utils/long_text_item.dart';
import 'package:food_app/utils/screen_dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text_widgets.dart';
import 'package:food_app/widgets/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(ScreenDimension.radius20),
                        topLeft: Radius.circular(ScreenDimension.radius20)),
                  ),
                  child: Center(
                    child: BigText(
                      size: ScreenDimension.font26,
                      text: 'Nigerian Fries',
                    ),
                  ),
                )),
            pinned: true,
            backgroundColor: AppColors.primaryColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/second_food.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenDimension.width20,
                      right: ScreenDimension.width20,
                      top: ScreenDimension.height10,
                      bottom: ScreenDimension.height20),
                  child: ExpandableText(
                    text: LongTextItem.collapsibleText,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: ScreenDimension.width20 * 2.5,
                right: ScreenDimension.width20 * 2.5,
                top: ScreenDimension.height10,
                bottom: ScreenDimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: ScreenDimension.iconSize24,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    icon: Icons.remove),
                BigText(
                  text: '₦750.00  X  0',
                ),
                AppIcon(
                    iconSize: ScreenDimension.iconSize24,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                    borderRadius:
                        BorderRadius.circular(ScreenDimension.radius20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenDimension.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: BigText(
                        text: '₦730 | Add to cart', color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
