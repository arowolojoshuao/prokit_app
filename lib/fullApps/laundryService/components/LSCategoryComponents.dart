import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSCommon.dart';

class LSCategoryComponents extends StatefulWidget {
  static String tag = '/LSCategoryComponents';
  final LSServiceModel? data;

  LSCategoryComponents(this.data);

  @override
  LSCategoryComponentsState createState() => LSCategoryComponentsState();
}

class LSCategoryComponentsState extends State<LSCategoryComponents> {
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: boxDecorationRoundedWithShadow(30, backgroundColor: widget.data!.isSelected.validate() ? LSColorPrimary.withOpacity(0.3) : white),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(8),
          child: lsCommonCachedNetworkImage(widget.data!.img.validate(), height: 30, width: 30, fit: BoxFit.cover),
        ),
        Text(widget.data!.title.validate(), style: primaryTextStyle()),
        4.height,
      ],
    ).onTap(() {
      widget.data!.isSelected = !widget.data!.isSelected.validate();
      setState(() {});
    });
  }
}
