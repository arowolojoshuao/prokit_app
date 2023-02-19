import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/commons/order_widget.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:flutter/material.dart';

class ActiveComponent extends StatefulWidget {
  @override
  _ActiveComponentState createState() => _ActiveComponentState();
}

class _ActiveComponentState extends State<ActiveComponent> {
  List<CallingModel> activeData = activeDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: activeData.length,
      padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 24),
      itemBuilder: (context, index) {
        CallingModel data = activeData[index];

        return OrderWidget(data: data, btnText1: "In Delivery", btnText2: "Track order");
      },
    );
  }
}
