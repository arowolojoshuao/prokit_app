import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:scan/scan.dart';

class WAQrScannerScreen extends StatefulWidget {
  static String tag = '/WAQrScannerScreen';

  @override
  WAQrScannerScreenState createState() => WAQrScannerScreenState();
}

class WAQrScannerScreenState extends State<WAQrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: Colors.green.shade400,
            onCapture: (data) {
              // do something
            },
          ),
          Column(
            children: [
              30.height,
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ).onTap(() {
                  finish(context);
                }).paddingOnly(top: 8, right: 16),
              ),
              30.height,
              Text('Hold  your Card inside the frame', style: boldTextStyle(color: Colors.white, size: 18)),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radius(30), backgroundColor: Colors.white),
              child: Icon(Icons.close, color: WAPrimaryColor),
            ).onTap(() {
              finish(context);
            }),
          ).paddingBottom(60),
        ],
      ),
    );
  }
}
