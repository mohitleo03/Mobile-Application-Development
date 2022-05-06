import 'package:firstapp/screens/sweep_grad.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({ Key? key }) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
   Widget _buildImage(String AssetURL, [double width = 350]) {
    return Image.network(AssetURL, width: width);
  }
    Widget _buildFullscreenImage() {
    return Image.network(
      'https://wallpapercave.com/dwp2x/wp4850274.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => sweep_grad()),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Fractional shares",
              body:
              "Instead of having to buy an entire share, invest any amount you want.",
              image: _buildImage('https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Learn as you go",
              body:
              "Download the Stockpile app and master the market with our mini-lesson.",
              image: _buildImage('https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
              image: _buildImage('https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Full Screen Page",
              body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
              image: _buildFullscreenImage(),
              decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
              ),
            ),
            PageViewModel(
              title: "Another title page",
              body: "Another beautiful body text for this example onboarding",
              image: _buildImage('https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360'),
              footer: ElevatedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                },
                child: const Text(
                  'FooButton',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Title of last page - reversed",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Click on ", style: bodyStyle),
                  Icon(Icons.edit),
                  Text(" to edit a post", style: bodyStyle),
                ],
              ),
              decoration: pageDecoration.copyWith(
                bodyFlex: 2,
                imageFlex: 4,
                bodyAlignment: Alignment.bottomCenter,
                imageAlignment: Alignment.topCenter,
              ),
              image: _buildImage('https://img.freepik.com/free-photo/orchid-flower-against-blue-background_23-2149244138.jpg?w=360'),
              reverse: true,
            ),
          ],
        // done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
          skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          ),
      ),
    ); //Material App;
  }
}