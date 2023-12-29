import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartBar extends StatefulWidget {
  const LineChartBar({super.key});

  @override
  State<LineChartBar> createState() => _LineChartBarState();
}

class _LineChartBarState extends State<LineChartBar> {
  late List<SalesData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: 398,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: SfCartesianChart(
        title: const ChartTitle(
            text: 'Revenue Overview',
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            alignment: ChartAlignment.near),
        legend: const Legend(isVisible: true, position: LegendPosition.bottom),
        series: <CartesianSeries>[
          LineSeries<SalesData, double>(
            name: 'Sales',
            dataSource: _chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
        primaryXAxis: const NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 2),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}
