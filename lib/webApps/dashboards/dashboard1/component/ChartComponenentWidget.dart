import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';

class ChartComponentWidget extends StatefulWidget {
  const ChartComponentWidget({Key? key}) : super(key: key);

  @override
  _ChartComponentWidgetState createState() => _ChartComponentWidgetState();
}

class _ChartComponentWidgetState extends State<ChartComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: paiChartSelectionData,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sectionsSpace: 0,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                16.height,
                Text('29.1', style: boldTextStyle(color: white)),
                Text("of 128GB", style: boldTextStyle(color: white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(color: WDPrimaryColor, value: 25, showTitle: false, radius: 25),
    PieChartSectionData(color: Color(0xFF26E5FF), value: 20, showTitle: false, radius: 22),
    PieChartSectionData(color: Color(0xFFFFCF26), value: 10, showTitle: false, radius: 19),
    PieChartSectionData(color: Color(0xFFEE2727), value: 15, showTitle: false, radius: 16),
    PieChartSectionData(color: WDPrimaryColor.withOpacity(0.1), value: 25, showTitle: false, radius: 13),
  ];
}
