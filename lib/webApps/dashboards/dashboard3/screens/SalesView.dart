import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/ActivityChartWebComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/OrderListWebComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/TotalListWebComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/ChartModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/DataProvider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesView extends StatefulWidget {
  @override
  SalesViewState createState() => SalesViewState();
}

class SalesViewState extends State<SalesView> {
  List<OrderModel> typeList = getOrderTypeList();
  List<OrderModel> totalList = getTotalList();

  String date = DateFormat("dd, MMMM, yyyy").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      //padding: EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dashboard', style: boldTextStyle(color: primaryColor, size: 18)),
                    4.height,
                    Text('$date', style: primaryTextStyle(color: primaryColor, size: 15)),
                  ],
                ),
                context.width() > 1200 ? SizedBox(width: context.width() * 0.16) : Offstage(),
                Container(
                  height: 40,
                  width: context.width() * 0.25,
                  child: AppTextField(
                    suffix: Container(
                      decoration: boxDecorationRoundedWithShadow(
                        cardRadius.toInt(),
                        backgroundColor: primaryColor,
                      ),
                      child: IconButton(
                          icon: Icon(Icons.search),
                          color: white,
                          onPressed: () {
                            toasty(context, 'Tap on the search bar to search');
                          }),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      hintText: 'Search',
                      hintStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(borderRadius: radius(cardRadius), borderSide: BorderSide.none),
                      fillColor: white,
                    ),
                    onTap: () {},
                    textFieldType: TextFieldType.OTHER,
                  ),
                ),
              ],
            ),
            16.height,
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: tertiaryColor),
              child: Column(
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: totalList.map((e) {
                      return TotalListWebComponent(data: e);
                    }).toList(),
                  ),
                  16.height,
                  Container(
                    height: 250,
                    decoration: boxDecorationRoundedWithShadow(
                      cardRadius.toInt(),
                      backgroundColor: white,
                      spreadRadius: 8,
                      shadowColor: secondaryColor,
                    ),
                    child: SfCartesianChart(
                      enableAxisAnimation: true,
                      title: ChartTitle(
                        text: 'Sales Report',
                        textStyle: boldTextStyle(color: primaryColor),
                      ),
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<ChartModel, String>>[
                        ColumnSeries<ChartModel, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartModel chart, _) => chart.month,
                          yValueMapper: (ChartModel chart, _) => chart.sales,
                          name: 'Target achieved',
                          animationDuration: 5000,
                          enableTooltip: true,
                          color: primaryColor,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: typeList.map((e) {
                          return OrderListWebComponent(data: e);
                        }).toList(),
                      ).expand(),
                      8.width,
                      ActivityChartWebComponent(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
