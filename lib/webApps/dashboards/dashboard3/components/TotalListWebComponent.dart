import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';

class TotalListWebComponent extends StatefulWidget {
  const TotalListWebComponent({Key? key, required this.data}) : super(key: key);
  final OrderModel data;

  @override
  _TotalListWebComponentState createState() => _TotalListWebComponentState();
}

class _TotalListWebComponentState extends State<TotalListWebComponent> {
  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (context, isHover) {
        return Container(
          width: context.width() / 6,
          height: 100,
          padding: EdgeInsets.all(8),
          decoration: commonCardDecoration(context, isHover: isHover),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Icon(widget.data.icon, color: primaryColor),
                  ),
                  16.width,
                  Text(
                    widget.data.change > 0 ? '+${widget.data.change.toString()}%' : '-${widget.data.change.toString()}%',
                    style: primaryTextStyle(color: isHover ? white : black, size: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              4.height,
              Wrap(
                runAlignment: WrapAlignment.start,
                spacing: 40,
                children: [
                  Text(
                    widget.data.name.validate(),
                    style: boldTextStyle(color: isHover ? white : primaryColor, size: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${widget.data.price.toString()}',
                    style: primaryTextStyle(color: isHover ? white : primaryColor, size: 15),
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
