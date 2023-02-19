import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/Component/CheckOutComponent.dart';
import 'package:prokit_flutter/integrations/models/StripePayModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class StripePaymentScreen extends StatefulWidget {
  @override
  StripePaymentScreenState createState() => StripePaymentScreenState();
}

class StripePaymentScreenState extends State<StripePaymentScreen> {
  @override
  void initState() {
    super.initState();

    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
    });
  }

  Future<void> init() async {
    //
  }

  void stripePay() async {
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Bearer $stripePaymentKey',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };

    var request = http.Request('POST', Uri.parse(stripeURL));

    request.bodyFields = {
      'amount': '${(5 * 100).toInt()}',
      'currency': 'INR'.toLowerCase(),
    };

    request.headers.addAll(headers);

    await request.send().then(
      (value) {
        http.Response.fromStream(value).then((response) async {
          if (response.statusCode == 200) {
            var res = StripePayModel.fromJson(await handleResponse(response));

/*            await Stripe.instance.initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: res.client_secret!,
                testEnv: true,
                merchantCountryCode: 'IN',
                merchantDisplayName: 'Prokit Flutter',
                customerId: '1',
                customerEphemeralKeySecret: res.client_secret!,
                setupIntentClientSecret: res.client_secret!,
              ),
            );*/
/*
            await Stripe.instance
                .presentPaymentSheet(parameters: PresentPaymentSheetParameters(clientSecret: res.client_secret!, confirmPayment: true))
                .then(
                  (value) async {},
                )
                .catchError((e) {
              print("presentPaymentSheet ${e.toString()}");
            });*/
          }
        }).catchError((e) {
          print(e.toString());
        });
      },
    ).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.cardColor,
        appBar: appBar(context, 'Stripe Payment Checkout'),
        body: SingleChildScrollView(
          child: CheckOutComponent(
            currency: '₹',
            cardNetwork: 'Visa',
            cartNumber: '4242 4242 4242 4242',
            cardCVV: 'Any 3 digits',
            expiryDate: '	Any future date',
          ),
        ),
        bottomNavigationBar: AppButton(
          width: context.width(),
          text: 'Pay with Stripe',
          textColor: Colors.white,
          textStyle: boldTextStyle(color: white),
          color: appColorPrimary,
          onTap: () {
            stripePay();
          },
        ).paddingAll(16));
  }

  Future handleResponse(Response response, [bool? avoidTokenError]) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      try {
        var body = jsonDecode(response.body);
        throw parseHtmlString(body['message']);
      } on Exception catch (e) {}
    }
  }
}

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}
