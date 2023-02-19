import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/widgets/JSFilteredResultWidget.dart';

class JSFilteredResultsComponent extends StatefulWidget {
  final String? city;

  JSFilteredResultsComponent({this.city});

  @override
  _JSFilteredResultsComponentState createState() => _JSFilteredResultsComponentState();
}

class _JSFilteredResultsComponentState extends State<JSFilteredResultsComponent> {
  List<JSPopularCompanyModel> filteredResultsList = getFilteredResultsData();

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
    return ListView.builder(
      itemCount: filteredResultsList.length,
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        JSPopularCompanyModel data = filteredResultsList[index];

        return JSFilteredResultWidget(filteredResultsList: data, city: widget.city, index: index);
      },
    );
  }
}
