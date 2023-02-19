import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryDeliveryAddress extends StatefulWidget {
  static String tag = '/GroceryDeliveryAddress';

  @override
  _GroceryDeliveryAddressState createState() => _GroceryDeliveryAddressState();
}

class _GroceryDeliveryAddressState extends State<GroceryDeliveryAddress> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  String? selectedLocation1 = "Pannipitiya";
  String? selectedLocation2 = "Egodawatta";

  List<String> location1 = ["Pannipitiya"];

  List<String> location2 = ["Egodawatta"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(
        grocery_lbl_Delivery_Address,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: [
              Container(
                width: width,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeLight_Color),
                      child: Image.asset(
                        Grocery_ic_Home,
                        height: 10,
                        width: 10,
                        color: grocery_color_white,
                      ).paddingAll(12),
                    ),
                    16.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enter delivery address", style: boldTextStyle()),
                          Text("Your Delivery address", style: secondaryTextStyle()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              16.height,
              Column(
                children: [
                  DropdownButton(
                    isExpanded: true,
                    value: selectedLocation1,
                    underline: Container(height: 0),
                    icon: Icon(Icons.arrow_drop_down),
                    style: primaryTextStyle(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          selectedLocation1 = newValue;
                        },
                      );
                    },
                    items: location1.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    itemHeight: 50,
                  ),
                  Divider(height: 20),
                  8.height,
                ],
              ),
              Container(
                child: Column(
                  children: [
                    DropdownButton(
                      isExpanded: true,
                      value: selectedLocation2,
                      underline: Container(height: 0),
                      icon: Icon(Icons.arrow_drop_down),
                      style: primaryTextStyle(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            selectedLocation2 = newValue;
                          },
                        );
                      },
                      items: location2.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      itemHeight: 50,
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ),
              EditText(text: "424/ 1D, Palanwattam, Pannipitiya", isPassword: false),
              16.height,
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(grocery_lbl_Save, style: boldTextStyle()),
                  color: grocery_colorPrimary,
                  onTap: () {
                    finish(context);
                  },
                ),
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
