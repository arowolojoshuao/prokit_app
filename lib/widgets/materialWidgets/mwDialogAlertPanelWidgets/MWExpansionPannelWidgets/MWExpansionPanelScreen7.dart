import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/component/MWExpansionPanel7ComponentWidget.dart';

class MWExpansionPanelScreen7 extends StatefulWidget {
  const MWExpansionPanelScreen7({Key? key}) : super(key: key);

  @override
  _MWExpansionPanelScreen7State createState() => _MWExpansionPanelScreen7State();
}

class _MWExpansionPanelScreen7State extends State<MWExpansionPanelScreen7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Expansion Panel 7'),
      body: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30, top: 26),
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return MWExpansionPanel7ComponentWidget().paddingSymmetric(horizontal: 16, vertical: 8);
              })),
    );
  }
}
