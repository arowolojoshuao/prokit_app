import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/snapping_sheet.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryCategoryList.dart';
import 'GroceryProductDescription.dart';

class GroceryStore extends StatefulWidget {
  @override
  _GroceryStoreState createState() => _GroceryStoreState();
}

class _GroceryStoreState extends State<GroceryStore> with SingleTickerProviderStateMixin {
  late List<ProductModel> mStoreDealList;
  var _controller = SnappingSheetController();
  late AnimationController _arrowIconAnimationController;
  Animation<double>? arrowIconAnimation;

  // ignore: non_constant_identifier_names
  double MoveAmount = 0.0;

  @override
  void initState() {
    super.initState();
    mStoreDealList = storeMemberItems();

    _arrowIconAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    arrowIconAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(curve: Curves.elasticOut, reverseCurve: Curves.elasticIn, parent: _arrowIconAnimationController));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget mHeading(var value) {
      return Container(
        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            text(value, fontFamily: fontMedium),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: grocery_lbl_view_all, style: TextStyle(fontSize: textSizeMedium, color: grocery_textColorSecondary)),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(left: spacing_control),
                      child: Icon(Icons.keyboard_arrow_right, color: grocery_textColorSecondary, size: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SnappingSheet(
        onSnapEnd: () {
          if (_controller.snapPositions.last != _controller.currentSnapPosition) {
            _arrowIconAnimationController.reverse();
          } else {
            _arrowIconAnimationController.forward();
          }
        },
        onMove: (moveAmount) {
          setState(() {
            MoveAmount = moveAmount!;
          });
        },
        snappingSheetController: _controller,
        initSnapPosition: SnapPosition(positionFactor: 0.75),
        snapPositions: [
          SnapPosition(positionPixel: 25.0, snappingCurve: Curves.elasticOut, snappingDuration: Duration(milliseconds: 750)),
          SnapPosition(positionFactor: 0.7, snappingCurve: Curves.ease, snappingDuration: Duration(milliseconds: 500)),
        ],
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: width * 0.52),
                mHeading(grocery_title_grocery_member_deals),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mStoreDealList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StoreDeal(mStoreDealList[index], index);
                    },
                  ),
                ),
                mHeading(grocery_title_grocery_deals),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mStoreDealList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StoreDeal(mStoreDealList[index], index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        grabbingHeight: MediaQuery.of(context).padding.bottom + 25,
        grabbing: GrabSection(),
        sheetAbove: SnappingSheetContent(child: Cateogry()),
      ),
    );
  }
}

class Cateogry extends StatefulWidget {
  @override
  CateogryState createState() => CateogryState();
}

class CateogryState extends State<Cateogry> {
  late List<CategoryModel> mStoreCategoryList;

  @override
  void initState() {
    super.initState();
    mStoreCategoryList = storeCategoryItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          8.height,
          Container(
            padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_control, spacing_standard_new, spacing_standard_new),
            child: Text(grocery_title_all_category, style: boldTextStyle()),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 8),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 0, mainAxisSpacing: 0, childAspectRatio: 0.9),
              itemCount: mStoreCategoryList.length,
              itemBuilder: (context, index) {
                return StoreCategory(mStoreCategoryList[index], index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class GrabSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 20.0, color: Colors.black.withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 4.0,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ],
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
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        GroceryProductDescription().launch(context);
      },
      child: Container(
        width: context.width() * 0.38,
        decoration: boxDecorationWithShadow(
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: context.cardColor,
        ),
        margin: EdgeInsets.only(left: 16, bottom: 16),
        padding: EdgeInsets.all(spacing_middle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                  decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                  child: Text(model.weight, style: boldTextStyle(color: black, size: 14)),
                ),
                Icon(Icons.favorite_border, color: grocery_icon_color)
              ],
            ),
            16.height,
            Align(
              alignment: Alignment.center,
              child: commonCacheImageWidget(model.img, 86, fit: BoxFit.fill, width: 86),
            ),
            4.height,
            Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(model.name, style: boldTextStyle(size: 18)),
                  Text(model.price, style: secondaryTextStyle(size: 16)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StoreCategory extends StatelessWidget {
  late CategoryModel model;

  StoreCategory(CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: boxDecorationWithShadow(
              boxShadow: defaultBoxShadow(),
              boxShape: BoxShape.circle,
              backgroundColor: context.cardColor,
            ),
            width: 42,
            height: 42,
            padding: EdgeInsets.all(9),
            child: Image.asset(model.img, color: grocery_colorPrimary),
          ),
          8.height,
          Text(model.name, style: boldTextStyle(size: 14))
        ],
      ),
    ).onTap(
      () {
        GroceryCategoryList().launch(context);
      },
    );
  }
}
