import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/component/sector_stock_componet.dart';
import 'package:prokit_flutter/fullApps/stockMarket/component/stock%20_futures_component.dart';
import 'package:prokit_flutter/fullApps/stockMarket/component/watch_list_component.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/view_all_stock_gainer_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/constant.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/data_generator.dart';

class MarketFragment extends StatefulWidget {
  @override
  _MarketFragmentState createState() => _MarketFragmentState();
}

class _MarketFragmentState extends State<MarketFragment> {
  List<StockInvestModel> stockFutureData = stockFutureList();
  List<StockInvestModel> sectorStockData = sectorStockList();
  List<StockInvestModel> watchData = watchList();

  bool? isActive;

  OverlayEntry? sideSheetOverlayEntry;
  final sideSheetOverlayLayerLink = LayerLink();

  TextEditingController searchCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    isActive = true;
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    setState(() {
      isActive = false;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void veiwAllSectorStock() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: radiusOnly(topLeft: 25, topRight: 25),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 10,
                width: 40,
                margin: EdgeInsets.only(top: 16),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  backgroundColor: appStore.isDarkModeOn ? white : gray.withOpacity(0.2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Stock Sectors", style: boldTextStyle(size: 18)),
                  IconButton(
                    onPressed: () {
                      finish(context);
                    },
                    icon: Icon(
                      Icons.close,
                    ),
                  )
                ],
              ).paddingOnly(left: 16, top: 16, right: 8),
              Divider(color: appStore.isDarkModeOn ? white : gray.withOpacity(0.2)),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(
                  sectorStockData.length,
                  (index) {
                    return Container(
                      decoration: commonDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                      margin: EdgeInsets.all(8),
                      width: context.width() * 0.32 - 16,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationWithRoundedCorners(
                              boxShape: BoxShape.circle,
                              backgroundColor: appStore.isDarkModeOn ? cardDarkColor : primaryColor,
                            ),
                            child: CommonCachedNetworkImage(sectorStockData[index].image.validate(), color: white, fit: BoxFit.cover, height: 22, width: 22),
                          ),
                          16.height,
                          Marquee(directionMarguee: DirectionMarguee.oneDirection, child: Text(sectorStockData[index].title.validate(), style: boldTextStyle())),
                          4.height,
                          Text(sectorStockData[index].stockScale.validate(), style: secondaryTextStyle()),
                        ],
                      ),
                    );
                  },
                ),
              ).paddingSymmetric(vertical: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarWidget(
          context,
          title: "Markets",
          changeIcon: true,
          showLeadingIcon: false,
          iconWidget1: IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.filter_list, color: context.iconColor, size: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                controller: searchCont,
                decoration: inputDecoration(
                  context,
                  labelText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: appStore.isDarkModeOn ? white : gray.withOpacity(0.8),
                  ),
                ),
              ).paddingSymmetric(horizontal: 16),
              28.height,
              Text('Stock Futures', style: boldTextStyle(size: headingTextSize)).paddingOnly(left: 16),
              16.height,
              HorizontalList(
                itemCount: stockFutureData.length,
                padding: EdgeInsets.all(16),
                spacing: 16,
                runSpacing: 8,
                itemBuilder: (_, index) => StockFuturesComponent(stockFutureData[index]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sector Stock', style: boldTextStyle(size: headingTextSize)).paddingOnly(left: 16, bottom: 16, top: 16),
                  TextButton(
                    onPressed: () {
                      veiwAllSectorStock();
                    },
                    child: Text('View All', style: secondaryTextStyle()),
                  ).visible(sectorStockData.length >= 5).paddingOnly(right: 8)
                ],
              ),
              HorizontalList(
                itemCount: 20,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemBuilder: (_, index) => SectorStockComponent(sectorStockData[index % sectorStockData.length]),
              ),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Stock Gainer', style: boldTextStyle(size: headingTextSize)),
                      4.width,
                      Icon(Icons.keyboard_arrow_down_outlined, color: context.iconColor),
                    ],
                  ).paddingOnly(left: 16),
                  TextButton(
                    onPressed: () {
                      ViewAllStockGainerScreen().launch(context);
                    },
                    child: Text('View All', style: secondaryTextStyle()),
                  ).visible(sectorStockData.length >= 5).paddingOnly(right: 8)
                ],
              ),
              8.height,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) => WatchListComponent(watchData[index % watchData.length]).paddingOnly(bottom: 16),
              ).paddingSymmetric(horizontal: 8),
            ],
          ),
        ),
      ),
    );
  }
}
