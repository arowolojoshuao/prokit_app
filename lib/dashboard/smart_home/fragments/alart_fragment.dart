import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/smart_home/fragments/dashboard_fragment.dart';

class AlartFragment extends StatefulWidget {
  @override
  _AlartFragmentState createState() => _AlartFragmentState();
}

class _AlartFragmentState extends State<AlartFragment> {
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
    return Scaffold(
      body: DashBoardFragment(),
    );
  }
}
