import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/view/FlutterwaveWebView.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/view/flutterwave_style.dart';

import '../models/TransactionError.dart';
import '../models/requests/standard_request.dart';
import '../models/responses/standard_response.dart';
import 'TransactionCallBack.dart';

class NavigationController {
  Client client;
  final FlutterwaveStyle? style;
  final TransactionCallBack _callBack;

  NavigationController(this.client, this.style, this._callBack);

  /// Initiates initial transaction to get web url
  startTransaction(final StandardRequest request) async {
    try {
      final StandardResponse standardResponse = await request.execute(this.client);
      if (standardResponse.status == "error") {
        throw (TransactionError(standardResponse.message!));
      }
      openBrowser(standardResponse.data?.link ?? "", request.redirectUrl);
    } catch (error) {
      throw (error);
    }
  }

  /// Opens browser with URL returned from startTransaction()
  openBrowser(final String url, final String redirectUrl, [final bool isTestMode = false]) async {
    final FlutterwaveInAppBrowser browser = FlutterwaveInAppBrowser(callBack: _callBack);

    var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: true),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );

    await browser.openUrlRequest(urlRequest: URLRequest(url: Uri.parse(url)), options: options);
  }
}
