import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/stock_detail_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';

class WatchListComponent extends StatelessWidget {
  final StockInvestModel data;

  WatchListComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.1),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          paymentComponent(data.image.validate(), logo_color: data.imageBackground),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title.validate(), style: boldTextStyle()),
              8.height,
              Text(data.subTitle.validate(), style: secondaryTextStyle()),
            ],
          ).expand(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.stockPrice.validate(), style: boldTextStyle(color: data.priceColor!)),
              8.height,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.only(right: 4),
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      backgroundColor: data.priceColor!,
                      border: Border.all(color: white),
                    ),
                    child: data.icon.validate(),
                  ),
                  Text(data.stockScale.validate(), style: primaryTextStyle(color: data.priceColor)),
                ],
              ),
            ],
          ),
        ],
      ),
    ).onTap(() {
      StockDetailScreen().launch(context);
    });
  }
}
