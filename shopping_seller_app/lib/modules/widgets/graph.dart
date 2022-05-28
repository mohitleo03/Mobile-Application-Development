import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

  class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
class myGraph extends StatelessWidget {
  const myGraph({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
      List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
    return Container(
      child: Container(
          margin: EdgeInsets.all(50),
          child: Column(children: [
            //Initialize the chart widget
            SfCartesianChart(
                primaryXAxis: CategoryAxis(isVisible: false),
                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ]),
        )
    );
  }
}