import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/core/transaction_status.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils.dart';

class FlutterwaveWebview extends StatefulWidget {
  final String _url;
  final String _redirectUrl;
  final bool _isTestMode;

  FlutterwaveWebview(this._url, this._redirectUrl, this._isTestMode);

  @override
  _FlutterwaveWebviewState createState() => _FlutterwaveWebviewState();
}

class _FlutterwaveWebviewState extends State<FlutterwaveWebview> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: widget._isTestMode,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: WebView(
              initialUrl: this.widget._url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: this._pageStarted,
              navigationDelegate: (action) {
                if (_hasCompletedTransaction(action.url)) {
                  _processTransactionData(action.url);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getRedirectUrl() {
    return this.widget._redirectUrl.isEmpty ? Utils.DEFAULT_URL : this.widget._redirectUrl;
  }

  void _processTransactionData(String url) {
    final uri = Uri.parse(url);
    final String? status = uri.queryParameters["status"];
    final Map<String, dynamic> result = Map();
    if ("successful" == status) {
      result["tx_ref"] = uri.queryParameters["tx_ref"];
      result["transaction_id"] = uri.queryParameters["transaction_id"];
      result["status"] = TransactionStatus.SUCCESSFUL;
    } else if ("cancelled" == status) {
      result["status"] = TransactionStatus.CANCELLED;
    } else {
      result["status"] = TransactionStatus.ERROR;
    }
    result["success"] = TransactionStatus.SUCCESSFUL == status;
    return Navigator.pop(this.context, result);
  }

  bool _hasCompletedTransaction(url) {
    final uri = Uri.parse(url);
    final String? status = uri.queryParameters["status"];
    return url.contains(_getRedirectUrl()) && status != null;
  }

  void _pageStarted(String url) {
    final redirectUrl = _getRedirectUrl();

    final bool startsWithMyRedirectUrl = url.toString().indexOf(redirectUrl.toString()) == 0;

    if (url != this.widget._url && startsWithMyRedirectUrl) {
      return this._onValidationSuccessful(url);
    }
  }

  void _onValidationSuccessful(String url) {
    _processTransactionData(url);
  }
}
