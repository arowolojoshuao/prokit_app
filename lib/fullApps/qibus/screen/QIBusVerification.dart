import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'QIBusDashboard.dart';

class QIBusVerification extends StatefulWidget {
  static String tag = '/QIBusVerification';

  @override
  QIBusVerificationState createState() => QIBusVerificationState();
}

class QIBusVerificationState extends State<QIBusVerification> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    setStatusBarColor(qIBus_colorPrimary);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            title(QIBus_verification, context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: qibus_ic_gr_mobile_otp,
                      fit: BoxFit.contain,
                      width: width * 0.5,
                      height: width * 0.5,
                    ),
                    text(QIBus_lbl_verification, isLongText: true, isCentered: true),
                    16.height,
                    PinEntryTextField(fields: 4, fontSize: textSizeLargeMedium),
                    16.height,
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _start == 0
                              ? Text(QIBus_txt_Resend, style: TextStyle(color: qIBus_colorPrimary, fontSize: textSizeMedium))
                              : Text("$_start Seconds", style: TextStyle(color: qIBus_colorPrimary, fontSize: textSizeMedium)),
                          Row(
                            children: <Widget>[
                              text(QIBus_txt_verify),
                              8.width,
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: qIBus_colorPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.arrow_forward, color: qIBus_white),
                              ).onTap(
                                () {
                                  setState(
                                    () {
                                      QIBusDashboard().launch(context);
                                    },
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
