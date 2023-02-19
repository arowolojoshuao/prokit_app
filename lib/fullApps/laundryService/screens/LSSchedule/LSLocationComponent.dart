import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSAddressModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSAddAddressScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';

class LSLocationComponent extends StatefulWidget {
  static String tag = '/LSLocationComponent';

  @override
  LSLocationComponentState createState() => LSLocationComponentState();
}

class LSLocationComponentState extends State<LSLocationComponent> {
  int? currentTimeValue = 0;
  int? index = 0;
  List<LSSelectionModel>? addressList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    addressList!.add(LSSelectionModel(index: 0, title: 'Home', subTitle: 'H No 3341, 2nd floor, sector 21D, Near Aroma Hotel, chandigarth'));
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.height(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Where should we deliver?', style: boldTextStyle()).paddingAll(16),
            if (addressList!.isNotEmpty)
              ListView.builder(
                  itemCount: addressList!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                      width: context.width(),
                      child: Theme(
                        data: Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).iconTheme.color),
                        child: RadioListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(left: 0),
                          activeColor: LSColorPrimary,
                          value: i,
                          groupValue: currentTimeValue,
                          onChanged: (dynamic ind) {
                            setState(() {
                              currentTimeValue = ind;
                              index = addressList![currentTimeValue.validate()].index;
                              log(index);
                            });
                          },
                          title: Text(addressList![i].title.validate(), style: primaryTextStyle()),
                          subtitle: Text(addressList![i].subTitle.validate(), style: secondaryTextStyle()),
                        ),
                      ),
                    );
                  }),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Row(
                children: [
                  Icon(Icons.add, color: LSColorPrimary),
                  8.width,
                  Text('Add Address', style: boldTextStyle(color: LSColorPrimary)),
                ],
              ),
            ).onTap(() {
              LSAddAddressScreen().launch(context);
            }),
          ],
        ),
      ),
    );
  }
}
