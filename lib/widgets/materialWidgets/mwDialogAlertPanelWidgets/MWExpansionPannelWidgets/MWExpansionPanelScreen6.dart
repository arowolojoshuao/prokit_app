import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/component/MWExpansionPanel6ComponentWidget.dart';

class MWExpansionPanelScreen6 extends StatefulWidget {
  const MWExpansionPanelScreen6({Key? key}) : super(key: key);

  @override
  _MWExpansionPanelScreen6State createState() => _MWExpansionPanelScreen6State();
}

class _MWExpansionPanelScreen6State extends State<MWExpansionPanelScreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Expansion Panel  6'),
      body: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30, top: 26),
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return MWExpansionPanel6ComponentWidget();
              })),
    );
  }
}
