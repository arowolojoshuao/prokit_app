import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';

class AssetsComponent extends StatelessWidget {
  final StockInvestModel data;

  AssetsComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: commonDecoration(),
      width: context.width(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                  ),
                ],
              ),
              Column(
                children: [
                  Text(data.stockPrice.validate(), style: boldTextStyle(color: data.priceColor)),
                  8.height,
                  Text('Per year', style: secondaryTextStyle()),
                ],
              )
            ],
          ),
          16.height,
          Divider(height: 0, color: appStore.isDarkModeOn ? dividerDarkColor : gray.withOpacity(0.1)),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Portfolio Value', style: secondaryTextStyle()),
                  8.height,
                  Text(data.stockScale.validate(), style: boldTextStyle()),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Profit', style: secondaryTextStyle()),
                  8.height,
                  Text(data.profit.validate(), style: boldTextStyle(color: data.priceColor)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
