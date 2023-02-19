import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';

class NewsComponent extends StatelessWidget {
  final StockInvestModel data;

  NewsComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: commonDecoration(),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CommonCachedNetworkImage(data.image, width: 40, height: 40, fit: BoxFit.cover),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.title.validate(), style: boldTextStyle()),
              8.height,
              Row(
                children: [
                  Text(data.subTitle.validate(), style: boldTextStyle(color: Colors.red)),
                  8.width,
                  Container(
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.red, boxShape: BoxShape.circle),
                    width: 6,
                    height: 6,
                  ),
                  8.width,
                  Text(data.stockScale.validate(), style: secondaryTextStyle(size: 12)),
                ],
              ),
            ],
          ).expand()
        ],
      ),
    );
  }
}
