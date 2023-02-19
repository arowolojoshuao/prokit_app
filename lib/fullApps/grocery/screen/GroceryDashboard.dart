import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddSaveCartName.dart';
import 'GroceryCheckOut.dart';
import 'GroceryGotQuestion.dart';
import 'GroceryNotification.dart';
import 'GroceryOrderHistory.dart';
import 'GroceryProductDescription.dart';
import 'GroceryProfile.dart';
import 'GrocerySaveCart.dart';
import 'GrocerySearch.dart';
import 'GroceryStore.dart';
import 'GroceryStoreLocator.dart';
import 'GroceryTermCondition.dart';
import 'GroceryTrackOrder.dart';

class GroceryDashBoardScreen extends StatefulWidget {
  static String tag = '/GroceryDashBoardScreen';

  @override
  _GroceryDashBoardScreenState createState() => _GroceryDashBoardScreenState();
}

class _GroceryDashBoardScreenState extends State<GroceryDashBoardScreen> {
  late List<ProductModel> mFavouriteList;
  late List<ProductModel> mCartList;

  List<IconData> listImage = [
    Icons.insert_drive_file,
    Icons.location_on,
    Icons.shopping_cart,
    Icons.store,
    Icons.help,
    Icons.question_answer,
  ];

  var listText = [
    grocery_orderHistory,
    grocery_trackOrders,
    grocery_lbl_save_cart,
    grocery_storeLocator,
    grocery_lbl_Terms_and_Condition,
    grocery_gotQuestion,
  ];

  var listClick = [
    GroceryOrderHistoryScreen(),
    GroceryTrackOrderScreen(),
    GrocerySaveCart(),
    GroceryStoreLocatorScreen(),
    GroceryTermCondition(),
    GroceryGotQuestionScreen(),
  ];

  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
    mFavouriteList = storeMemberItems();
    mCartList = storeMemberItems();
  }

  @override
  Widget build(BuildContext context) {
    var mCart = SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(spacing_standard_new),
            width: context.width(),
            decoration: boxDecorationWithShadow(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(spacing_middle),
                bottomLeft: Radius.circular(spacing_middle),
              ),
              boxShadow: defaultBoxShadow(),
              backgroundColor: context.cardColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(grocery_lbl_subtotal, style: secondaryTextStyle(size: 16)),
                    Text(grocery_lbl_price, style: boldTextStyle()),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(grocery_lbl_promotion_discount, style: secondaryTextStyle(size: 16)),
                    Text(grocery_lbl_promotion_discount_price, style: boldTextStyle()),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      color: context.cardColor,
                      child: Text("$grocery_lbl_save_cart", style: boldTextStyle(color: appStore.isDarkModeOn ? white : black)),
                      onTap: () {
                        GroceryAddSaveCartName().launch(context);
                      },
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    ),
                    16.width,
                    AppButton(
                      color: grocery_colorPrimary,
                      child: Text(grocery_lbl_checkout, style: boldTextStyle(color: white)),
                      onTap: () {
                        GroceryCheckOut().launch(context);
                      },
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    ),
                  ],
                )
              ],
            ),
          ),
          16.height,
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mCartList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Cart(mCartList[index], index);
            },
          ),
        ],
      ),
    );

    var mFavourite = Container(
      margin: EdgeInsets.only(top: spacing_middle, right: spacing_standard_new),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: mFavouriteList.length,
        itemBuilder: (context, index) {
          return StoreDeal(mFavouriteList[index], index);
        },
      ),
    );

    Widget mMenuOption(var icon, var value, Widget tag) {
      return Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: boxDecoration(
              radius: 25.0,
              bgColor: appStore.isDarkModeOn ? scaffoldDarkColor : grocery_colorPrimary_light,
            ),
            child: Icon(icon, color: grocery_colorPrimary).paddingAll(12),
          ).paddingOnly(top: spacing_control, left: spacing_standard, bottom: spacing_control),
          8.width,
          Text(value, style: primaryTextStyle()).paddingOnly(left: spacing_standard, right: spacing_standard),
        ],
      ).onTap(() {
        tag.launch(context);
      });
    }

    final menu = IconButton(
      icon: Icon(Icons.menu, color: white),
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          transitionDuration: Duration(milliseconds: 500),
          barrierLabel: MaterialLocalizations.of(context).dialogLabel,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (context, _, __) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: spacing_large),
                  Container(
                    color: context.cardColor,
                    child: Row(
                      children: [
                        Icon(Icons.clear, color: grocery_light_gray_color).onTap(
                          () {
                            finish(context);
                          },
                        ),
                        24.width,
                        text(
                          "Grocery shopping app",
                          textColor: appStore.isDarkModeOn ? white : grocery_Color_black,
                          fontFamily: fontBold,
                          fontSize: textSizeLargeMedium,
                        )
                      ],
                    ).paddingAll(16),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: spacing_standard),
                    width: context.width(),
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(24), bottomLeft: Radius.circular(24)),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: listImage.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return mMenuOption(listImage[index], listText[index], listClick[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: CurvedAnimation(parent: animation, curve: Curves.easeOut).drive(
                Tween<Offset>(begin: Offset(0, -1.0), end: Offset.zero),
              ),
              child: child,
            );
          },
        );
      },
    );

    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: grocery_colorPrimary,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      menu,
                      SizedBox(width: spacing_large),
                      text("Store", textColor: grocery_color_white, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.search, color: white),
                        onTap: () {
                          GrocerySearch().launch(context);
                        },
                      ),
                      SizedBox(width: spacing_standard_new),
                      GestureDetector(
                        child: Icon(Icons.notifications, color: white),
                        onTap: () {
                          GroceryNotification().launch(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            bottom: TabBar(
              indicatorColor: grocery_color_white,
              tabs: [
                Tab(icon: Image.asset(grocery_ic_shop, color: grocery_color_white, height: 20, width: 20)),
                Tab(icon: Icon(Icons.shopping_basket)),
                Tab(
                  icon: Image.asset(grocery_ic_outline_favourite, color: grocery_color_white, height: 20, width: 20),
                ),
                Tab(icon: Image.asset(Grocery_ic_User, color: grocery_color_white, height: 20, width: 20))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GroceryStore(),
              mCart,
              mFavourite,
              GroceryProfile(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  late ProductModel model;

  Cart(ProductModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    Widget? mRemoveItem() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(spacing_large),
                    topRight: Radius.circular(spacing_large),
                  ),
                  color: context.cardColor,
                ),
                height: MediaQuery.of(context).size.height / 2.8,
                padding: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_color_red),
                          padding: EdgeInsets.all(context.width() * 0.02),
                          child: Icon(Icons.delete, color: grocery_color_white),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(grocery_lbl_remove_an_item, style: boldTextStyle()),
                              8.height,
                              Text(grocery_lbl_remove_confirmation, style: secondaryTextStyle()),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: spacing_large),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Text("$grocery_lbl_no".toUpperCase(), style: boldTextStyle()),
                          color: context.cardColor,
                          onTap: () {
                            finish(context);
                          },
                        ),
                        16.width,
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Text(grocery_lbl_remove.toUpperCase(), style: boldTextStyle()),
                          color: grocery_color_red,
                          onTap: () {
                            finish(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Container(
      decoration: boxDecorationWithShadow(
        borderRadius: BorderRadius.circular(4),
        boxShadow: defaultBoxShadow(),
        backgroundColor: context.cardColor,
      ),
      padding: EdgeInsets.fromLTRB(spacing_middle, 0, spacing_middle, spacing_middle),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                commonCacheImageWidget(model.img, 100, fit: BoxFit.fill),
                SizedBox(height: spacing_control),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                      decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                      margin: EdgeInsets.only(right: spacing_middle),
                      child: Text(model.weight, style: boldTextStyle(color: black, size: 14)),
                    ),
                    text(model.price, fontSize: textSizeLargeMedium),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(model.price, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                    IconButton(
                      onPressed: () {
                        mRemoveItem();
                      },
                      icon: Icon(Icons.delete_outline, color: grocery_icon_color),
                    )
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                  child: text(model.name, textColor: grocery_textColorSecondary),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.remove_circle_outline, size: 28, color: grocery_icon_color),
                    Text(grocery_lbl_product_weight, style: boldTextStyle()),
                    Icon(Icons.add_circle_outline, size: 28, color: grocery_icon_color),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Favourite extends StatelessWidget {
  late ProductModel model;

  Favourite(ProductModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GroceryProductDescription().launch(context);
      },
      child: Container(
        decoration: boxDecoration(showShadow: true),
        padding: EdgeInsets.all(spacing_middle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                  decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                  child: text(model.weight, fontSize: textSizeSmall, isCentered: true),
                ),
                Icon(Icons.favorite_border, color: grocery_icon_color)
              ],
            ),
            Image.asset(
              model.img,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(model.name, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                  text(model.price),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
