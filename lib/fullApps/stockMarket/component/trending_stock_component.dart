import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';

class TrendingStockComponent extends StatelessWidget {
  final StockInvestModel data;

  TrendingStockComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: commonDecoration(),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentComponent(data.image.validate(), logo_color: data.imageBackground),
            16.height,
            Text(data.title.validate(), style: boldTextStyle()),
            8.height,
            Row(
              children: [
                Text(data.stockPrice.validate(), style: secondaryTextStyle()),
                16.width,
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
                      child: data.icon,
                    ),
                    Text(data.stockScale.validate(), style: primaryTextStyle(color: data.priceColor)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
