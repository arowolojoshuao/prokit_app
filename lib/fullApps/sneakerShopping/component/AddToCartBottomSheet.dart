import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';

class AddToCartBottomSheet extends StatefulWidget {
  @override
  AddToCartBottomSheetState createState() => AddToCartBottomSheetState();
}

class AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int increment = 1;

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
    return Container(
      padding: EdgeInsets.all(16),
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white12, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage("images/sneakerShopping/ic_shoes_2.png"),
                    height: 80,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Nike Air VaporMax Evoo", overflow: TextOverflow.ellipsis, style: boldTextStyle(), maxLines: 1),
                  SizedBox(height: 4),
                  Text("Ment's shoe", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                  SizedBox(height: 4),
                  Text("\$182", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: primaryTextStyle()),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey),
          SizedBox(height: 8),
          Text("Select Size", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 4, top: 4, bottom: 4),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Text("US 7", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Text("US 8", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Text("US 9", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Text("US 10", textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text('Quantity', textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle()),
              ),
              InkWell(
                onTap: () {
                  if (increment > 1) {
                    increment--;
                    setState(() {});
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(Icons.remove, color: Colors.grey, size: 18),
                ),
              ),
              SizedBox(height: 16, width: 16),
              Text("$increment", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 14)),
              SizedBox(height: 16, width: 16),
              InkWell(
                onTap: () {
                  increment++;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(Icons.add, color: Colors.grey, size: 18),
                ),
              ),
            ],
          ),
          Spacer(),
          sSAppButton(
            context: context,
            title: 'Add to Cart',
            onPressed: () {
              finish(context);
            },
          ),
        ],
      ),
    );
  }
}
