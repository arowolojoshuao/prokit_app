import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSOfferComponent.dart';

class LSOfferFragment extends StatefulWidget {
  static String tag = '/LSOfferFragment';

  @override
  LSOfferFragmentState createState() => LSOfferFragmentState();
}

class LSOfferFragmentState extends State<LSOfferFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(context.cardColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Offer', center: true, showBack: false, color: context.cardColor),
      body: LSOfferComponent(),
    );
  }
}
