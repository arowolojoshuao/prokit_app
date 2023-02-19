import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/ActivityChartTabletComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/ProfileComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/TotalListTabletComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/TypeListTabletComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/ChartModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/screens/MyDrawer.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/DataProvider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainMobileComponent extends StatefulWidget {
  @override
  MainMobileComponentState createState() => MainMobileComponentState();
}

class MainMobileComponentState extends State<MainMobileComponent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<OrderModel> typeList = getOrderTypeList();
  List<OrderModel> totalList = getTotalList();
  List<OrderModel> orderList = getOrderList();

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
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          width: context.width(),
          color: secondaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      tooltip: 'Main Drawer',
                      icon: Icon(FontAwesome.list, color: primaryColor, size: 15)),
                  8.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dashboard', style: boldTextStyle(color: primaryColor)),
                      Text('$date', style: primaryTextStyle(size: 14, color: primaryColor)),
                    ],
                  ),
                  8.width,
                  IconButton(
                      onPressed: () {
                        ProfileComponent().launch(context);
                      },
                      tooltip: 'User Profile',
                      icon: Icon(Ionicons.person, color: primaryColor)),
                ],
              ),
              8.height,
              Container(
                height: 40,
                margin: EdgeInsets.all(8),
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
              8.height,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: totalList.map((e) {
                  return TotalListTabletComponent(data: e);
                }).toList(),
              ),
              8.height,
              Container(
                margin: EdgeInsets.all(8),
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
              8.height,
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: typeList.map((e) {
                  return TypeListTabletComponent(data: e);
                }).toList(),
              ),
              8.height,
              Container(margin: EdgeInsets.all(8), child: ActivityChartTabletComponent()),
              8.height,
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top item of this month', style: boldTextStyle(size: 18, color: primaryColor)),
                    8.height,
                    Container(
                      height: 62,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          OrderModel e = orderList.last;
                          orderList.sort((a, b) => a.quantity!.compareTo(b.quantity!));
                          return HoverWidget(
                            builder: (context, isHover) {
                              return SettingItemWidget(
                                padding: EdgeInsets.all(8),
                                decoration: commonCardDecoration(context, isHover: isHover),
                                leading: Container(
                                  height: 45,
                                  width: 50,
                                  padding: EdgeInsets.all(4),
                                  decoration: boxDecorationWithRoundedCorners(
                                    borderRadius: radius(cardRadius),
                                    backgroundColor: secondaryColor,
                                  ),
                                  child: Icon(e.icon, color: primaryColor),
                                ),
                                title: e.name!,
                                titleTextStyle: primaryTextStyle(color: isHover ? white : primaryColor),
                                subTitle: "${e.quantity} pieces",
                                subTitleTextStyle: primaryTextStyle(color: isHover ? white : primaryColor),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              8.height,
              Container(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                margin: EdgeInsets.all(8),
                decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Orders', style: boldTextStyle(size: 18, color: primaryColor)),
                        Text(
                          'SEE ALL',
                          style: primaryTextStyle(size: 10, color: primaryColor),
                        ).onTap(() {
                          toasty(context, 'Scroll to see all');
                        }),
                      ],
                    ),
                    16.height,
                    Container(
                      height: context.height() * 0.42,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          OrderModel e = orderList[index];
                          return HoverWidget(
                            builder: (context, isHover) {
                              return SettingItemWidget(
                                decoration: commonCardDecoration(context, isHover: isHover),
                                padding: EdgeInsets.all(8),
                                leading: Container(
                                  height: 45,
                                  width: 50,
                                  decoration: boxDecorationWithRoundedCorners(
                                    borderRadius: radius(cardRadius),
                                    backgroundColor: isHover ? secondaryColor : primaryColor,
                                  ),
                                  child: Icon(e.icon, color: isHover ? primaryColor : secondaryColor),
                                ),
                                title: '${e.name}',
                                titleTextStyle: boldTextStyle(color: isHover ? white : primaryColor),
                                subTitle: '${e.time}m ago',
                                subTitleTextStyle: primaryTextStyle(color: isHover ? white : primaryColor),
                                trailing: Text(
                                  '\$${e.price}',
                                  style: boldTextStyle(color: isHover ? white : primaryColor),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
