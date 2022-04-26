import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Wave extends StatefulWidget {
  late double height;
  Wave({required this.height});
  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  _buildCard({
    required Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage? backgroundImage,
    required double height,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
    );
  }

  MaskFilter? _blur;
  final List<MaskFilter> _blurs = [
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      height: widget.height,
      backgroundColor: Colors.purpleAccent,
      config: CustomConfig(
        gradients: [
          [Colors.red, Color(0xEEF44336)],
          [Colors.red, Color(0x77E57373)],
          [Colors.orange, Color(0x66FF9800)],
          [Colors.yellow, Color(0x55FFEB3B)]
        ],
        durations: [35000, 19440, 10800, 6000],
        heightPercentages: [0.20, 0.23, 0.25, 0.30],
        blur: _blur,
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
    )
        // _buildCard(
        //     config: CustomConfig(
        //       colors: [
        //         Colors.white70,
        //         Colors.white54,
        //         Colors.white30,
        //         Colors.white24,
        //       ],
        //       durations: [32000, 21000, 18000, 5000],
        //       heightPercentages: [0.25, 0.26, 0.28, 0.31],
        //       blur: _blur,
        //     ),
        //     backgroundColor: Colors.blue
        // ),
        ;
  }
}
