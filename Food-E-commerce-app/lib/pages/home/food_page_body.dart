import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app_color.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:get/get.dart';
import 'package:food_app/widgets/big_text_widgets.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text_widget.dart';

import '../../utils/screen_dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = ScreenDimension.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        Container(
          height: ScreenDimension.pageView,
          // color: Colors.red,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),

        // Dots indicator
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: AppColors.mainColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Popular Text
        SizedBox(height: ScreenDimension.height30),

        //  Popular Text Container
        Container(
            margin: EdgeInsets.only(left: ScreenDimension.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Popular'),
                SizedBox(width: ScreenDimension.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: '.',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: ScreenDimension.width10),
                // Food pairing
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food Pairing'),
                ),
              ],
            )),

        //  List Of Food and Images
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  left: ScreenDimension.width20,
                  right: ScreenDimension.width20,
                  top: ScreenDimension.height10),
              child: Row(
                children: [
                  //  Image Section
                  Container(
                    width: ScreenDimension.listViewImageSize,
                    height: ScreenDimension.listViewImageSize,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ScreenDimension.radius20),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/second_food.png'),
                      ),
                    ),
                  ),
                  //  Text Section
                  Expanded(
                    child: Container(
                      height: ScreenDimension.listViewTextContainerize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(ScreenDimension.radius20),
                            bottomRight:
                                Radius.circular(ScreenDimension.radius20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: ScreenDimension.width10,
                            right: ScreenDimension.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritous Food Meal in Nigeria'),
                            SizedBox(height: ScreenDimension.height10),
                            SmallText(text: 'With Nigerian Characteristics '),
                            SizedBox(height: ScreenDimension.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: 'Normal',
                                  iconColor: AppColors.primaryColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: '1.7km',
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: '3min',
                                  iconColor: AppColors.iconColor2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var _curScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - _curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var _currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var _curScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - _curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _curScale, 1);
      matrix = Matrix4.diagonal3Values(1, _curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: ScreenDimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: ScreenDimension.width10, right: ScreenDimension.width10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(ScreenDimension.radius30),
              image: const DecorationImage(
                image: AssetImage('images/first_food.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenDimension.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: ScreenDimension.width30,
                  right: ScreenDimension.width30,
                  bottom: ScreenDimension.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenDimension.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  top: ScreenDimension.height15,
                  left: 15,
                  right: 15,
                ),
                child: AppColumn(
                  text: 'Nigerian Fries',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
