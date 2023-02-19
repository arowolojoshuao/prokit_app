import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayScreen extends StatefulWidget {
  @override
  RazorPayScreenState createState() => RazorPayScreenState();
}

class RazorPayScreenState extends State<RazorPayScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
    });

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 500 * 100,
      "currency": "USD",
      'name': 'Checkout',
      'description': 'Red Floral, Mom jeans',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    toasty(context, "SUCCESS: " + response.paymentId.validate());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    toasty(context, "ERROR: " + response.code.toString() + " - " + response.message.validate());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    toasty(context, "EXTERNAL_WALLET: " + response.walletName.validate());
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: appBar(context, 'RazorPay Payment Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheckOutComponent(cardNetwork: 'Visa', cartNumber: '4111 1111 1111 1111', cardCVV: 'Random CVV', expiryDate: 'Any future date'),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        text: 'Pay with RazorPay',
        textColor: Colors.white,
        textStyle: boldTextStyle(color: white),
        color: appColorPrimary,
        onTap: () {
          openCheckout();
        },
      ).paddingAll(16),
    );
  }
}
