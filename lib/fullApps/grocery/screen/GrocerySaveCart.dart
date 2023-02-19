import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryCheckOut.dart';

class GrocerySaveCart extends StatefulWidget {
  static String tag = '/GrocerySaveCart';

  @override
  GrocerySaveCartState createState() => GrocerySaveCartState();
}

class GrocerySaveCartState extends State<GrocerySaveCart> {
  late List<CartModel> mList;

  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
    mList = saveCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        title: Text(grocery_lbl_save_cart, style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(color: white),
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SaveCart(mList[index], index);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SaveCart extends StatefulWidget {
  late CartModel model;

  SaveCart(CartModel model, int pos) {
    this.model = model;
  }

  @override
  State<SaveCart> createState() => _SaveCartState();
}

class _SaveCartState extends State<SaveCart> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget? mRemoveItem() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: context.cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(spacing_large),
                    topRight: Radius.circular(spacing_large),
                  ),
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
                          padding: EdgeInsets.all(width * 0.02),
                          child: Icon(Icons.delete, color: grocery_color_white),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(grocery_lbl_remove_saved_item, style: boldTextStyle()),
                              8.height,
                              Text(grocery_lbl_remove_confirmation, style: secondaryTextStyle()),
                            ],
                          ),
                        )
                      ],
                    ),
                    24.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Text("$grocery_lbl_no", style: boldTextStyle()),
                          color: context.cardColor,
                          onTap: () {
                            finish(context);
                          },
                        ),
                        16.width,
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Text(grocery_lbl_remove, style: boldTextStyle()),
                          color: grocery_color_red,
                          onTap: () {
                            finish(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Container(
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(8),
        boxShadow: defaultBoxShadow(),
        backgroundColor: context.cardColor,
      ),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
      padding: EdgeInsets.all(spacing_middle),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary),
                padding: EdgeInsets.all(width * 0.02),
                child: Icon(Icons.shopping_cart, color: grocery_color_white),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.model.name, style: boldTextStyle(size: 18)),
                        IconButton(
                          icon: Icon(Icons.delete_outline, color: grocery_icon_color),
                          onPressed: () {
                            mRemoveItem();
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(grocery_msg_subtotal, style: secondaryTextStyle()),
                        4.width,
                        Text(grocery_lbl_rs + " " + widget.model.price, style: boldTextStyle()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(grocery_lbl_total_items, style: secondaryTextStyle()),
                        4.width,
                        Text(widget.model.totalItem, style: boldTextStyle()),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          4.height,
          Divider(),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                color: context.cardColor,
                child: Text("$grocery_lbl_view_cart", style: boldTextStyle()),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onTap: () {
                  //
                },
              ),
              SizedBox(width: spacing_standard_new),
              AppButton(
                color: grocery_colorPrimary,
                child: Text(grocery_lbl_checkout, style: boldTextStyle()),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onTap: () {
                  GroceryCheckOut().launch(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
