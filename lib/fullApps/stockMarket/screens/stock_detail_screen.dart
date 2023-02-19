import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/component/news_component.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/constant.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/data_generator.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class StockDetailScreen extends StatefulWidget {
  @override
  _StockDetailScreenState createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  List<String> data = ['Overview', 'Statistics', 'History Data', 'Overview', 'Statistics', 'History Data'];

  List<String> selectedData = ['24H', '7D', '1M', '3M', '1Y', 'ALL'];

  int selectedIndex = 0;
  int selectedStockIndex = 0;

  List<StockInvestModel> stockPrice = stockPriceList();

  List<StockInvestModel> stockNewsData = stockNewsList();

  List<Color> gradientColor = [lineCChart, lineCChart1];

  List<FlSpot> list1 = [FlSpot(0, 1.5), FlSpot(1.5, 2), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 6)];
  List<FlSpot> list2 = [FlSpot(0, 3), FlSpot(3.1, 4), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 4)];
  List<FlSpot> list3 = [FlSpot(0, 1.5), FlSpot(2, 2.3), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 4)];
  List<FlSpot> list4 = [FlSpot(0, 1), FlSpot(3.5, 6), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 4)];
  List<FlSpot> list5 = [FlSpot(0, 2), FlSpot(1.5, 2), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 4)];
  List<FlSpot> list6 = [FlSpot(0, 1.5), FlSpot(1.5, 2), FlSpot(4.9, 5), FlSpot(6.8, 2.5), FlSpot(8, 4), FlSpot(9.5, 3), FlSpot(9, 6)];

  List<FlSpot> newList = [];

  void initstate() {
    super.initState();
    init();
  }

  void init() async {
    newList.addAll(list1);
    setStatusBarColor(primaryColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.arrow_back_outlined, color: white),
            ),
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  toast("Ratting");
                },
                icon: Icon(Icons.star, color: Colors.yellow, size: 26),
              ),
              IconButton(
                  onPressed: () {
                    toast("Notification");
                  },
                  icon: Icon(Icons.notifications_none, color: white, size: 26)),
              IconButton(onPressed: () {}, icon: Icon(Icons.upload_outlined, color: white, size: 26))
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: boxDecorationWithRoundedCorners(backgroundColor: primaryColor, borderRadius: BorderRadius.zero),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: gray.withOpacity(0.4)),
                      width: context.width(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: boxDecorationWithRoundedCorners(
                                  boxShape: BoxShape.circle,
                                  backgroundColor: salmon,
                                ),
                                child: CommonCachedNetworkImage(amd_stock, color: white, fit: BoxFit.cover, width: 50, height: 50),
                              ),
                              16.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("AMD", style: boldTextStyle(color: white)),
                                  8.height,
                                  Text("Advanced Micro Devices ", style: secondaryTextStyle(color: white.withOpacity(0.5))),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("\$72.21%", style: boldTextStyle(color: white)),
                              12.height,
                              Row(
                                children: [
                                  Container(
                                    decoration: boxDecorationWithRoundedCorners(
                                      boxShape: BoxShape.circle,
                                      backgroundColor: gray,
                                    ),
                                    child: Icon(Icons.keyboard_arrow_down_sharp, color: primaryColor),
                                  ),
                                  8.width,
                                  Text('5.79%', style: secondaryTextStyle(color: white.withOpacity(0.5))),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    16.height,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        16.height,
                        Container(
                          padding: EdgeInsets.only(right: 16),
                          height: 350,
                          width: context.width(),
                          child: LineChart(
                            LineChartData(
                              minX: 0,
                              maxX: 11,
                              minY: 0,
                              maxY: 6,
                              titlesData: LineTitles.getTitleData(),
                              gridData: FlGridData(
                                  show: true,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: borderText.withOpacity(0.3),
                                      strokeWidth: 0.2,
                                    );
                                  },
                                  drawVerticalLine: true),
                              borderData: FlBorderData(border: Border.all(color: borderText, width: 0.1)),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: newList,
                                  isCurved: true,
                                  colors: [greenColor, greenColor],
                                  barWidth: 3,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: gradientColor.map((e) {
                                      return e.withOpacity(0.5);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        HorizontalList(
                          itemCount: selectedData.length,
                          padding: EdgeInsets.all(16),
                          spacing: 8,
                          runSpacing: 16,
                          itemBuilder: (_, index) => Container(
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: selectedStockIndex == index
                                  ? appStore.isDarkModeOn
                                      ? cardDarkColor
                                      : white
                                  : Colors.transparent,
                              border: Border.all(color: selectedStockIndex == index ? Colors.transparent : gray.withOpacity(0.1)),
                            ),
                            margin: EdgeInsets.only(right: 8),
                            child: Text(
                              selectedData[index],
                              style: boldTextStyle(
                                color: selectedStockIndex == index
                                    ? appStore.isDarkModeOn
                                        ? white
                                        : black
                                    : white,
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                          ).onTap(() {
                            setState(() {
                              selectedStockIndex = index;
                            });

                            if (index == 0) {
                              newList.clear();
                              newList.addAll(list1);
                            } else if (index == 1) {
                              newList.clear();
                              newList.addAll(list1);
                            } else if (index == 2) {
                              newList.clear();
                              newList.addAll(list3);
                            } else if (index == 3) {
                              newList.clear();
                              newList.addAll(list4);
                            } else if (index == 4) {
                              newList.clear();
                              newList.addAll(list5);
                            } else if (index == 5) {
                              newList.clear();
                              newList.addAll(list6);
                            }
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              HorizontalList(
                itemCount: data.length,
                padding: EdgeInsets.all(16),
                spacing: 8,
                runSpacing: 16,
                itemBuilder: (_, index) => Container(
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: selectedIndex == index
                        ? Colors.yellow
                        : appStore.isDarkModeOn
                            ? dividerDarkColor
                            : white,
                    border: Border.all(color: selectedIndex == index ? Colors.transparent : gray.withOpacity(0.1)),
                  ),
                  margin: EdgeInsets.only(right: 8),
                  child: Text(
                    data[index],
                    style: boldTextStyle(
                      color: selectedIndex == index
                          ? black
                          : appStore.isDarkModeOn
                              ? white
                              : black,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                ).onTap(() {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(color: appStore.isDarkModeOn ? white : gray.withOpacity(0.2)),
                physics: NeverScrollableScrollPhysics(),
                itemCount: stockPrice.length,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(stockPrice[index].title.validate(), style: secondaryTextStyle()),
                    Text(stockPrice[index].stockPrice.validate(), style: boldTextStyle()),
                  ],
                ).paddingSymmetric(vertical: 8),
              ),
              SizedBox(
                width: context.width(),
                child: OutlinedButton(
                  onPressed: () {
                    //
                  },
                  style: OutlinedButton.styleFrom(
                    onSurface: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  child: Text('Show All', style: boldTextStyle()),
                ),
              ).paddingSymmetric(horizontal: 16, vertical: 8),
              16.height,
              Text('Latest news', style: boldTextStyle(size: headingTextSize)).paddingOnly(left: 16),
              16.height,
              ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemBuilder: (_, index) => NewsComponent(stockNewsData[index % stockNewsData.length]).paddingOnly(bottom: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context) => primaryTextStyle(color: white.withOpacity(0.5)),
            getTitles: (val) {
              switch (val.toInt()) {
                case 1:
                  return '40.00';
                case 2:
                  return '50.00';
                case 3:
                  return '60.00';
                case 4:
                  return '70.00';
                case 5:
                  return '80.00';
              }
              return '';
            },
            reservedSize: 35),
        show: true,
        bottomTitles: SideTitles(
          getTextStyles: (context) => boldTextStyle(color: white.withOpacity(0.5)),
          showTitles: true,
          margin: 24,
          reservedSize: 38,
          getTitles: (val) {
            switch (val.toInt()) {
              case 2:
                return '08:00';
              case 4:
                return '09:00';
              case 6:
                return '10:00';
              case 8:
                return '11:00';
              case 10:
                return '12:00';
            }
            return '';
          },
        ),
      );
}
