import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    var barChartData = BarChartData();
    return BarChart(mainBarData());
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: getTilesForBottomAxis),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
      ),
    );
  }

  Widget getTilesForBottomAxis(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = "01";
        break;
      case 1:
        text = text = "02";
        break;
      case 2:
        text = text = "03";
        break;
      case 3:
        text = text = "04";
        break;
      case 4:
        text = text = "0";
      default:
        text = "";
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget getTilesForLeftAxis(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = "1k";
        break;
      case 1:
        text = text = "2k";
        break;
      case 2:
        text = text = "3k";
        break;
      case 3:
        text = text = "4k";
        break;
      case 4:
        text = text = "5k";
      default:
        text = "";
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
