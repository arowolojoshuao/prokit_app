import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
//import 'package:pay/pay.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GoogleAndApplePayScreen extends StatefulWidget {
  @override
  GoogleAndApplePayScreenState createState() => GoogleAndApplePayScreenState();
}

class GoogleAndApplePayScreenState extends State<GoogleAndApplePayScreen> {
  //List<PayProvider> availableProviders = [];

  static const _paymentItems = [
    //PaymentItem(label: 'Total', amount: '500.00', status: PaymentItemStatus.final_price),
  ];

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
      init();
    });
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: appBar(context, 'Google Pay Payment Checkout'),
      body: SingleChildScrollView(
        child: CheckOutComponent(warning: 'Create an account with the payment providers and generate merchant ID'),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(16),
/*        child: GooglePayButton(
          paymentConfigurationAsset: 'integrations/pay/default_payment_profile_google_pay.json',
          paymentItems: _paymentItems,
          style: GooglePayButtonStyle.black,
          type: GooglePayButtonType.pay,
          onPaymentResult: onGooglePayResult,
          loadingIndicator: Center(
            child: CircularProgressIndicator(),
          ),
        ),*/
      ),
    );
  }
}
