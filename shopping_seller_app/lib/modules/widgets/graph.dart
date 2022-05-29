import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/models/sales_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class myGraph extends StatelessWidget {
  List<SalesData> data;
  myGraph(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      width: 299,
      // margin: EdgeInsets.symmetric(horizontal: 33),
      child: Column(children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Enable legend
            legend: Legend(isVisible: true),
            plotAreaBorderColor: Colors.deepPurple,
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  color: Colors.deepPurple,
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) =>
                      sales.date.day.toString() +
                      "/" +
                      sales.date.month.toString(),
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ])
      ]),
    ));
  }
}
