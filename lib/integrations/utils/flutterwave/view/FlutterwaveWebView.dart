import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/core/TransactionCallBack.dart';

import '../utils.dart';

class FlutterwaveInAppBrowser extends InAppBrowser {
  String redirectUrl;
  final TransactionCallBack callBack;

  var hasCompletedProcessing = false;
  var haveCallBacksBeenCalled = false;

  FlutterwaveInAppBrowser({this.redirectUrl = Utils.DEFAULT_URL, required this.callBack});

  @override
  Future onBrowserCreated() async {}

  @override
  Future onLoadStart(url) async {
    final status = url?.queryParameters["status"];
    final txRef = url?.queryParameters["tx_ref"];
    final id = url?.queryParameters["transaction_id"];
    final hasRedirected = status != null && txRef != null;
    if (hasRedirected && url != null) {
      hasCompletedProcessing = hasRedirected;
      _processResponse(url, status, txRef, id);
    }
  }

  _processResponse(Uri url, String? status, String? txRef, String? id) {
    if ("successful" == status) {
      callBack.onTransactionSuccess(id!, txRef!);
    } else {
      callBack.onCancelled();
    }
    haveCallBacksBeenCalled = true;
    close();
  }

  @override
  Future onLoadStop(url) async {}

  @override
  void onLoadError(url, code, message) {
    callBack.onTransactionError();
  }

  @override
  void onProgressChanged(progress) {}

  @override
  void onExit() {
    if (!haveCallBacksBeenCalled) {
      callBack.onCancelled();
    }
  }
}
