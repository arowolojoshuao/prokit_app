import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWExpansionPanel3ComponentWidget extends StatefulWidget {
  const MWExpansionPanel3ComponentWidget({Key? key}) : super(key: key);

  @override
  _MWExpansionPanel3ComponentWidgetState createState() => _MWExpansionPanel3ComponentWidgetState();
}

class _MWExpansionPanel3ComponentWidgetState extends State<MWExpansionPanel3ComponentWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(8),
      leading: Icon(Icons.people, color: Colors.blue),
      title: Text('Customers', style: boldTextStyle(color: Colors.blue, size: 18)),
      trailing: isExpanded
          ? Icon(
              Icons.arrow_drop_up,
              color: context.iconColor,
              size: 30,
            )
          : Icon(
              Icons.arrow_drop_down,
              color: context.iconColor,
              size: 30,
            ),
      onExpansionChanged: (t) {
        isExpanded = !isExpanded;
        setState(() {});
      },
      children: [
        Container(
          height: 70,
          // color: pink,
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: [
              VerticalDivider(color: Colors.black26, width: 6),
              8.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Badges',
                    style: primaryTextStyle(weight: FontWeight.w500),
                  ),
                  Text(
                    'Customer Logs',
                    style: primaryTextStyle(weight: FontWeight.w500),
                  ),
                  Text(
                    'Gift Vouchers',
                    style: primaryTextStyle(weight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
