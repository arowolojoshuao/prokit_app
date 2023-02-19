import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/components/search_component.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/widgets.dart';
import 'package:prokit_flutter/main.dart';

import '../models/services_model.dart';
import '../utils/colors.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          "Search",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: appStore.isDarkModeOn ? white : black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 17),
                  decoration: commonInputDecoration(
                    hintText: "Search for services",
                    suffixIcon: Icon(Icons.search, size: 18, color: appStore.isDarkModeOn ? white : black),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              itemCount: serviceProviders.length,
              itemBuilder: (context, index) {
                return SearchComponent(index, servicesModel: serviceProviders[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
