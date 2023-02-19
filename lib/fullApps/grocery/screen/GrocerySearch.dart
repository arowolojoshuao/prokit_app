import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';

class GrocerySearch extends StatefulWidget {
  static String tag = '/GrocerySearch';

  @override
  GrocerySearchState createState() => GrocerySearchState();
}

class GrocerySearchState extends State<GrocerySearch> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        iconTheme: IconThemeData(color: grocery_color_white),
        actionsIconTheme: IconThemeData(color: grocery_color_white),
        title: TextFormField(
          controller: searchController,
          textInputAction: TextInputAction.search,
          style: primaryTextStyle(color: grocery_color_white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: primaryTextStyle(color: grocery_color_white),
          ),
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
        ),
        actions: [
          !searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: grocery_color_white),
                  onPressed: () {
                    searchController.clear();
                  },
                )
              : Container()
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              commonCachedNetworkImage(Grocery_ic_DeliveryBoy, fit: BoxFit.cover, height: 170, width: 170),
              Text(grocery_lbl_no_search_found, style: boldTextStyle(size: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
