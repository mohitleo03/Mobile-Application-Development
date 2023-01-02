import 'package:flutter/material.dart';
import 'package:food_app/widgets/small_text_widget.dart';

import '../app_color.dart';
import '../utils/screen_dimensions.dart';
import 'big_text_widgets.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: ScreenDimension.font26,
        ),
        SizedBox(
          height: ScreenDimension.height10,
        ),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 15,
                    )),
          ),
          SizedBox(width: 10),
          SmallText(text: '4.5'),
          SizedBox(width: 10),
          SmallText(text: '1278'),
          SizedBox(width: 5),
          SmallText(text: 'Comments')
        ]),
        SizedBox(height: ScreenDimension.height20),
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
        ),
      ],
    );
  }
}
