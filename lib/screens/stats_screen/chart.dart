
import 'package:expense_tracker/components/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarChart(mainBarData()),
    );
  }

  BarChartGroupData makeBarChartGroupData(int x, double y1) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          width: 10,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue,
          //     kTextColor,
          //     kYellowColor,
          //     kLightBlueColor,
          //     Colors.white
          //   ],
          //   transform: GradientRotation(pi / 40),
          // ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: kBlackCleanColor,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeBarChartGroupData(0, 2);
          case 1:
            return makeBarChartGroupData(1, 3);
          case 2:
            return makeBarChartGroupData(2, 2);
          case 3:
            return makeBarChartGroupData(3, 4.5);
          case 4:
            return makeBarChartGroupData(4, 3.8);
          case 5:
            return makeBarChartGroupData(5, 1.5);
          case 6:
            return makeBarChartGroupData(6, 4);
          case 7:
            return makeBarChartGroupData(7, 3.8);
          default:
            return throw Error();
        }
      });

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
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: getTilesForLeftAxis),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(show: false),
      barGroups: showingGroups(),
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
        text = text = "05";
      case 5:
        text = text = "06"; 
      case 6:
        text = text = "07";
      case 7:
        text = text = "08";
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
      case 2:
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
