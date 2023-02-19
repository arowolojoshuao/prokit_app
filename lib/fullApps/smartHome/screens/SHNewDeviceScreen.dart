import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';

class SHNewDeviceScreen extends StatefulWidget {
  @override
  SHNewDeviceScreenState createState() => SHNewDeviceScreenState();
}

class SHNewDeviceScreenState extends State<SHNewDeviceScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // QRViewController? controller;
  //
  // Barcode? result;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  // Widget _buildQrView(BuildContext context) {
  //   var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 230.0 : 300.0;
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: _onQRViewCreated,
  //     overlay: QrScannerOverlayShape(borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
  //   );
  // }

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Text(
            "The Qr code will be detected automatically\n when it's positioned within the guidelines ",
            style: primaryTextStyle(size: 18, color: Colors.white70),
          ),
        ),
        title: Text("New Device", style: boldTextStyle(color: white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: SHScaffoldDarkColor,
        iconTheme: IconThemeData(color: white),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/shHome/qrCode.png',
              fit: BoxFit.cover,
            ),
          ),
          // _buildQrView(context),
        ],
      ),
    );
  }
}
