import 'dart:io';

import 'package:flutter/material.dart';

//import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PayStackScreen extends StatefulWidget {
  @override
  PayStackScreenState createState() => PayStackScreenState();
}

class PayStackScreenState extends State<PayStackScreen> {
  //final plugin = PaystackPlugin();
  //CheckoutMethod method = CheckoutMethod.card;

  @override
  void initState() {
    super.initState();

    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
      init();
    });

    // plugin.initialize(publicKey: payStackPublicKey);
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  void payStackCheckOut(BuildContext context) async {
/*    Charge charge = Charge()
      ..amount = (500 * 100).toInt() // In base currency
      ..email = 'test@gmail.com'
      ..currency = 'ngn'
      ..card = PaymentCard(number: 'cardNumber', cvc: 'cvv', expiryMonth: 0, expiryYear: 0);

    charge.reference = _getReference();

    try {
      CheckoutResponse response = await plugin.checkout(context, method: method, charge: charge, fullscreen: false, logo: FlutterLogo());
      payStackUpdateStatus(response.reference, response.message);
      log(response.message);
      if (response.message == "Success") {
        snackBar(context, title: 'Payment Success');
      } else {
        print('payment fail');
      }
    } catch (e) {
      print("Check console for error");
      rethrow;
    }*/
  }

  void payStackUpdateStatus(String? reference, String message) {
    payStackShowMessage(message, const Duration(seconds: 7));
  }

  void payStackShowMessage(String message, [Duration duration = const Duration(seconds: 4)]) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: appBar(context, 'PayStack Checkout'),
      body: SingleChildScrollView(
        child: CheckOutComponent(
          currency: 'NGN',
          cardNetwork: 'Visa',
          cartNumber: '4084 0840 8408 4081',
          cardCVV: '408',
          expiryDate: 'Any future date',
          warning: 'Supported Country Ghana, Nigeria, South Africa',
        ),
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        text: 'Pay with PayStack',
        textColor: Colors.white,
        textStyle: boldTextStyle(color: white),
        color: appColorPrimary,
        onTap: () {
          payStackCheckOut(context);
        },
      ).paddingAll(16),
    );
  }
}
