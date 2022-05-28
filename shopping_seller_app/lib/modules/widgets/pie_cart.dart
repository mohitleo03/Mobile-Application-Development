import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class pie_chart extends StatelessWidget {
  Map<String, double> dataMap;
  String title;
  pie_chart(this.dataMap,this.title);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 2.4,
      colorList: [Colors.blue, Colors.green,Colors.red],
      initialAngleInDegree: 90,
      chartType: ChartType.ring,
      ringStrokeWidth: 40,
      centerText: title,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.left,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
