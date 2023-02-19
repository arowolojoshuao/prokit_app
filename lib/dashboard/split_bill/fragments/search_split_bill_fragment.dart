import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/home_split_bill_fragment.dart';

class SearchSplitBillFragment extends StatefulWidget {
  @override
  _SearchSplitBillFragmentState createState() => _SearchSplitBillFragmentState();
}

class _SearchSplitBillFragmentState extends State<SearchSplitBillFragment> {
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
