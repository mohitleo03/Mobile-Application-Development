import 'package:flutter/material.dart';
import 'package:food_app/app_color.dart';
import 'package:food_app/utils/screen_dimensions.dart';
import 'package:food_app/widgets/small_text_widget.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalfText;
  late String secondHalText;

  bool hiddenText = true;
  double textHeight = ScreenDimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalText.isEmpty
          ? SmallText(
              color: AppColors.paraColor,
              size: ScreenDimension.font16,
              text: firstHalfText)
          : Column(
              children: [
                SmallText(
                    height: 1.5,
                    color: AppColors.paraColor,
                    size: ScreenDimension.font16,
                    text: hiddenText
                        ? ('$firstHalfText...')
                        : (firstHalfText + secondHalText)),
                InkWell(
                  onTap: () {
                    //Something is going to happen here later
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(height: ScreenDimension.height10),
                      SmallText(
                        text: 'Show more',
                        size: 18,
                        color: AppColors.mainColor,
                      ),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
