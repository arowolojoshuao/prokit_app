import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/core/TransactionCallBack.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/core/navigation_controller.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/models/requests/customer.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/models/requests/customizations.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/models/requests/standard_request.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/models/responses/charge_response.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/view/flutterwave_style.dart';
import 'package:prokit_flutter/integrations/utils/flutterwave/view/view_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class FlutterWaveScreen extends StatefulWidget {
  @override
  FlutterWaveScreenState createState() => FlutterWaveScreenState();
}

class FlutterWaveScreenState extends State<FlutterWaveScreen> implements TransactionCallBack {
  late NavigationController controller;

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

  void flutterWaveCheckout() {
    _showConfirmDialog();
  }

  final style = FlutterwaveStyle(
    appBarText: "My Standard Blue",
    buttonColor: Color(0xffd0ebff),
    appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
    buttonTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    appBarColor: Color(0xffd0ebff),
    dialogCancelTextStyle: TextStyle(color: Colors.redAccent, fontSize: 18),
    dialogContinueTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
  );

  void _showConfirmDialog() {
    FlutterwaveViewUtils.showConfirmPaymentModal(
      context,
      "USD",
      '500',
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      style.getDialogBackgroundColor(),
      style.getDialogCancelTextStyle(),
      style.getDialogContinueTextStyle(),
      _handlePayment,
    );
  }

  void _handlePayment() async {
    print('handle ');
    final Customer customer = Customer(name: "Demo User", phoneNumber: "123456789", email: "test@gmail.com");

    final request = StandardRequest(
      txRef: DateTime.now().millisecond.toString(),
      amount: '500',
      customer: customer,
      paymentOptions: "card, payattitude",
      customization: Customization(title: "Test Payment"),
      isTestMode: true,
      publicKey: flutterWavePublicKey,
      currency: "USD",
      redirectUrl: "https://www.google.com",
    );

    try {
      Navigator.of(context).pop(); // to remove confirmation dialog
      controller.startTransaction(request);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    controller = NavigationController(Client(), style, this);
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: appBar(context, 'FlutterWave Checkout'),
      body: SingleChildScrollView(
        child: CheckOutComponent(
          cardNetwork: 'MasterCard',
          cartNumber: '5531 8866 5214 2950',
          cardCVV: '564',
          expiryDate: '09 / 32',
          pin: '3310',
          otp: '12345',
        ),
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        text: 'Pay with FlutterWave',
        textColor: Colors.white,
        textStyle: boldTextStyle(color: white),
        color: appColorPrimary,
        onTap: () {
          flutterWaveCheckout();
        },
      ).paddingAll(16),
    );
  }

  @override
  onTransactionError() {
    snackBar(context, title: errorMessage);
  }

  @override
  onCancelled() {
    snackBar(context, title: "Transaction Cancelled");
  }

  @override
  onTransactionSuccess(String id, String txRef) {
    final ChargeResponse chargeResponse = ChargeResponse(status: "success", success: true, transactionId: id, txRef: txRef);
    snackBar(context, title: "Payment Successfully");
    print("Payment Successfully");
  }
}
