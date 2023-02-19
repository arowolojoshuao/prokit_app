import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusHelp extends StatefulWidget {
  static String tag = '/QIBusHelp';

  @override
  QIBusHelpState createState() => QIBusHelpState();
}

class QIBusHelpState extends State<QIBusHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        TopBar(
          QIBus_lbl_help,
          icon: qibus_gif_bell,
          isVisible: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              child: Column(
                children: <Widget>[
                  editTextStyle(QIBus_hint_enter_your_contact_number),
                  16.height,
                  editTextStyle(QIBus_hint_enter_your_emailId),
                  16.height,
                  editTextStyle(QIBus_text_description, line: 3),
                  16.height,
                  QIBusAppButton(
                      textContent: QIBus_lbl_submit,
                      onPressed: () {
                        finish(context);
                      }),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
