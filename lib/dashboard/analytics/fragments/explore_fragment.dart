import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/analytics/fragments/analytics_dashboard_fragment.dart';

class ExploreFragment extends StatefulWidget {
  @override
  _ExploreFragmentState createState() => _ExploreFragmentState();
}

class _ExploreFragmentState extends State<ExploreFragment> {
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
    return AnalyticsDashboardFragment();
  }
}
