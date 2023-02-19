import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';

class OrderListWebComponent extends StatefulWidget {
  const OrderListWebComponent({Key? key, required this.data}) : super(key: key);
  final OrderModel data;

  @override
  OrderListWebComponentState createState() => OrderListWebComponentState();
}

class OrderListWebComponentState extends State<OrderListWebComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (context, isHover) {
        return Container(
          width: context.width() <= 1200 ? (context.width() * 0.10) : (context.width() * 0.124),
          padding: EdgeInsets.all(16),
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
                  backgroundColor: widget.data.color!.withOpacity(0.2),
                  borderRadius: radius(5),
                ),
                child: Icon(widget.data.icon, color: widget.data.color),
              ),
              4.height,
              Text(
                widget.data.name.validate(),
                style: primaryTextStyle(size: 15, color: isHover ? white : primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
              4.height,
              Text(
                widget.data.quantity.toString(),
                style: boldTextStyle(size: 15, color: isHover ? white : primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
