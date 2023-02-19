import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwDialogAlertPanelWidgets/MWExpansionPannelWidgets/component/MWExpansionPanel5ComponentWidget.dart';

class MWExpansionPanelScreen5 extends StatefulWidget {
  const MWExpansionPanelScreen5({Key? key}) : super(key: key);

  @override
  _MWExpansionPanelScreen5State createState() => _MWExpansionPanelScreen5State();
}

class _MWExpansionPanelScreen5State extends State<MWExpansionPanelScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Expansion Panel 5 '),
      body: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30, top: 26),
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return MWExpansionPanel5ComponentWidget().paddingSymmetric(
                  vertical: 8,
                  horizontal: 16,
                );
              })),
    );
  }
}
