import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/analytics/model/chart_data_model.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineChartComponent extends StatefulWidget {
  @override
  State<SplineChartComponent> createState() => _SplineChartComponentState();
}

class _SplineChartComponentState extends State<SplineChartComponent> {
  final List<ChartDataModel> chartData = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    for (int i = 1; i <= 30; i++) {
      chartData.add(ChartDataModel(dateMonthYear: i + 10, visitors: Random().nextInt(16000000).toDouble()));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(isVisible: false),
      primaryYAxis: NumericAxis(axisLine: AxisLine(width: 0), numberFormat: NumberFormat.compact()),
      crosshairBehavior: CrosshairBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        lineDashArray: [5, 5],
        shouldAlwaysShow: true,
        lineColor: iconContainerDarkColor,
      ),
      trackballBehavior: TrackballBehavior(enable: true, tooltipSettings: InteractiveTooltip(enable: true)),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        shouldAlwaysShow: true,
        builder: (data, point, series, pointIndex, seriesIndex) {
          return Material(
            elevation: 10,
            borderRadius: radius(5),
            child: Container(
              height: context.height() * 0.1,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${data.visitors}'.formatNumberWithComma().splitBefore('.'), style: boldTextStyle(size: 18)),
                  6.height,
                  Text('${data.dateMonthYear} Nov 2022', style: secondaryTextStyle()).expand(),
                ],
              ),
            ),
          );
        },
      ),
      series: <ChartSeries>[
        // Renders spline chart
        SplineSeries<ChartDataModel, int>(
          dataSource: chartData,
          xValueMapper: (ChartDataModel data, _) => data.dateMonthYear,
          yValueMapper: (ChartDataModel data, _) => data.visitors,
          color: chartSplineColor,
          enableTooltip: true,
        ),
      ],
    );
  }
}
