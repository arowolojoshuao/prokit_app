import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';

class TotalListTabletComponent extends StatelessWidget {
  const TotalListTabletComponent({Key? key, required this.data}) : super(key: key);
  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (context, isHover) {
        return Container(
          padding: EdgeInsets.all(8),
          width: context.width() * 0.44,
          height: context.height() * 0.15,
          decoration: commonCardDecoration(context, isHover: isHover),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: tertiaryColor,
                      borderRadius: radius(cardRadius),
                    ),
                    child: Icon(data.icon, color: primaryColor),
                  ),
                  8.width,
                  Text(
                    data.change > 0 ? '+${data.change.toString()}%' : '-${data.change.toString()}%',
                    style: primaryTextStyle(color: isHover ? white : black, size: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: boldTextStyle(color: isHover ? white : primaryColor, size: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.width,
                  Text(
                    '${data.price.toString()}',
                    style: primaryTextStyle(color: isHover ? white : primaryColor, size: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
