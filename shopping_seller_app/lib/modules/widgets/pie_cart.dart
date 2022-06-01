import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class pie_chart extends StatelessWidget {
  Map<String, double> dataMap;
  List<Color> colors;
  String title;
  pie_chart({required this.dataMap,required this.title,required this.colors});
  @override
  Widget build(BuildContext context) {
    Size device_size = MediaQuery.of(context).size;
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: device_size.width / 1.5,
      colorList: colors,
      initialAngleInDegree: 90,
      chartType: ChartType.ring,
      ringStrokeWidth: 55,
      centerText: title,

      legendOptions: const LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.deepPurple
            ),
      ),
      chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
          chartValueStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.deepPurple,
          )),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
