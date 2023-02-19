import 'package:prokit_flutter/fullApps/carea/commons/colors.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class OrderWidget extends StatefulWidget {
  CallingModel? data = CallingModel();
  String? btnText1;
  String? btnText2;

  OrderWidget({this.data, this.btnText1, this.btnText2});

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
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
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        backgroundColor: context.cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : editTextBgColor,
            ),
            child: Image.asset(widget.data!.imageUrl.validate(), width: 50, height: 50, fit: BoxFit.fill),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data!.userName.validate(), style: boldTextStyle(size: 16)),
              12.height,
              Row(
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: widget.data!.colorValue!),
                    height: 10,
                    width: 10,
                  ),
                  8.width,
                  Text(widget.data!.subTitle.validate(), style: secondaryTextStyle()),
                  8.width,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.3),
                    ),
                    child: Text(widget.btnText1.validate(), style: primaryTextStyle(size: 12)),
                  ),
                ],
              ),
              12.height,
              Row(
                children: [
                  Text(widget.data!.countNumber.validate(), style: boldTextStyle()),
                  16.width,
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : black,
                      ),
                      child: Text(widget.btnText2.validate(), style: primaryTextStyle(size: 12, color: white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
