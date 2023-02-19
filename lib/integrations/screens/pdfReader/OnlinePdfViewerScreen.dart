import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../main.dart';

class OnlinePdfViewerScreen extends StatefulWidget {
  @override
  OnlinePdfViewerScreenState createState() => OnlinePdfViewerScreenState();
}

class OnlinePdfViewerScreenState extends State<OnlinePdfViewerScreen> {
  String pdfURL = 'https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.scaffoldBackground!);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Online PDF Viewer', style: boldTextStyle(size: 22)),
            backgroundColor: appStore.appBarColor,
            leading: BackButton(
              color: appStore.textPrimaryColor,
              onPressed: () {
                finish(context);
              },
            ),
          ),
          body: SfPdfViewer.network(pdfURL)),
    );
  }
}
