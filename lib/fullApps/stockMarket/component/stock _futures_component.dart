import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class StockFuturesComponent extends StatelessWidget {
  final StockInvestModel data;

  StockFuturesComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: commonDecoration(),
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              paymentComponent(data.image.validate(), logo_color: data.imageBackground),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title.validate(), style: boldTextStyle()),
                  4.height,
                  Text(data.subTitle.validate(), style: secondaryTextStyle()),
                ],
              ),
            ],
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.stockPrice.validate(), style: boldTextStyle(size: 20)),
                  8.height,
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.only(right: 4),
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          backgroundColor: Colors.red,
                          border: Border.all(color: white),
                        ),
                        child: data.icon,
                      ),
                      Text(data.stockScale.validate(), style: primaryTextStyle(color: data.priceColor)),
                    ],
                  ),
                ],
              ),
              CommonCachedNetworkImage(graph, color: context.iconColor, fit: BoxFit.cover, height: 30, width: 60)
            ],
          ),
        ],
      ),
    );
  }
}
