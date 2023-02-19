import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';

class SectorStockComponent extends StatelessWidget {
  final StockInvestModel data;

  SectorStockComponent(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, border: Border.all(color: gray), backgroundColor: gray.withOpacity(0.1)),
          child: CommonCachedNetworkImage(data.image.validate(), color: context.iconColor, fit: BoxFit.cover, height: 24, width: 24),
        ),
        16.height,
        Text(data.title.validate(), style: boldTextStyle()),
        4.height,
        Text(data.stockScale.validate(), style: secondaryTextStyle()),
      ],
    ).paddingAll(4);
  }
}
