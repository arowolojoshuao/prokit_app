import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryProductDescription.dart';

class GrocerySubCategoryList extends StatefulWidget {
  static String tag = '/GrocerySubCategoryList';

  @override
  GrocerySubCategoryListState createState() => GrocerySubCategoryListState();
}

class GrocerySubCategoryListState extends State<GrocerySubCategoryList> {
  late List<ProductModel> mStoreDealList;

  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
    mStoreDealList = storeMemberItems();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(Icons.arrow_back, "Coffee", Icons.search, () {}),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle, top: spacing_middle),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.55,
            ),
            itemCount: mStoreDealList.length,
            itemBuilder: (context, index) {
              return StoreDeal(mStoreDealList[index], index);
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StoreDeal extends StatelessWidget {
  late ProductModel model;

  StoreDeal(ProductModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(showShadow: true, radius: 10.0),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                child: Text(model.weight, style: boldTextStyle(color: black, size: 14)),
              ),
              Icon(Icons.favorite_border, color: grocery_icon_color)
            ],
          ),
          8.height,
          commonCacheImageWidget(model.img, 90, fit: BoxFit.fill, width: 90),
          4.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.name, style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
              2.height,
              Text(model.price, style: secondaryTextStyle()),
            ],
          )
        ],
      ),
    ).onTap(
      () {
        GroceryProductDescription().launch(context);
      },
    );
  }
}
