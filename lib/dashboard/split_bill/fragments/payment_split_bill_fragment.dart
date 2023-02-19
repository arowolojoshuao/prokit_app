import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/home_split_bill_fragment.dart';

class PaymentSplitBillFragment extends StatefulWidget {
  @override
  _PaymentSplitBillFragmentState createState() => _PaymentSplitBillFragmentState();
}

class _PaymentSplitBillFragmentState extends State<PaymentSplitBillFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return HomeSplitBillFragment();
  }
}
