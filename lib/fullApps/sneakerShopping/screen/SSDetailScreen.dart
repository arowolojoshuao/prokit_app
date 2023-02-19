import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/component/AddToCartBottomSheet.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../main.dart';

class SSDetailScreen extends StatefulWidget {
  final String? img;

  SSDetailScreen({this.img});

  @override
  SSDetailScreenState createState() => SSDetailScreenState();
}

class SSDetailScreenState extends State<SSDetailScreen> {
  int index = 0;
  List<String> img = [
    "$BaseUrl/images/sneakerShopping/ic_shoes_7.png",
    "$BaseUrl/images/sneakerShopping/ic_shoes_9.png",
    "images/sneakerShopping/ic_shoes_2.png",
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    img.insert(0, widget.img.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: commonCachedNetworkImage(
          'images/sneakerShopping/ic_sneaker_logo.png',
          height: 30,
          width: 30,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        actions: [
          Icon(Icons.favorite_border, color: context.iconColor, size: 20).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Column(
                children: [
                  commonCachedNetworkImage(
                    img[index],
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: img.map((e) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        radius: 8,
                        onTap: () {
                          setState(() {
                            index = img.indexOf(e);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: index == img.indexOf(e) ? Colors.red : Colors.transparent,
                            ),
                          ),
                          child: commonCachedNetworkImage(e.validate(), height: 40, width: 40, fit: BoxFit.cover),
                        ),
                      ).paddingRight(8);
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Men's shoe", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Nike Air Vapormax Evo", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      Text("\$182", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Available Sizes", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 14)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 8, top: 4, bottom: 4),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 7", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 8", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 9", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 10", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16, width: 16),
                  Text("Description", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                  SizedBox(height: 8),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            SizedBox(width: 8),
            Expanded(
              child: sSAppButton(
                context: context,
                title: 'Buy Now',
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    ),
                    context: context,
                    builder: (_) {
                      return AddToCartBottomSheet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
