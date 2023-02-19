import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';

class TypeListTabletComponent extends StatelessWidget {
  const TypeListTabletComponent({Key? key, required this.data}) : super(key: key);
  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (context, isHover) {
        return Container(
          padding: EdgeInsets.all(8),
          width: context.width() * 0.44,
          height: context.height() * 0.18,
          decoration: commonCardDecoration(context, isHover: isHover),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                padding: EdgeInsets.all(4),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: data.color!.withOpacity(0.2),
                  borderRadius: radius(5),
                ),
                child: Icon(data.icon, color: data.color),
              ),
              4.height,
              Text(
                data.name.validate(),
                style: primaryTextStyle(color: isHover ? white : primaryColor, size: 15),
              ),
              Text(
                data.quantity.toString(),
                style: boldTextStyle(color: isHover ? white : primaryColor, size: 15),
              ),
            ],
          ),
        );
      },
    );
  }
}
