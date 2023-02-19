import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSAddressModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';

class LSAddAddressScreen extends StatefulWidget {
  static String tag = '/LSAddAddressScreen';

  @override
  LSAddAddressScreenState createState() => LSAddAddressScreenState();
}

class LSAddAddressScreenState extends State<LSAddAddressScreen> {
  TextEditingController areaCont = TextEditingController(text: 'Phase 8,Sector 59, Mohali');
  TextEditingController addressCont = TextEditingController(text: 'Plot no. E-216, First Floor, Phase 8b,Industrial Area Mohali, sector 74, Punjab 160055');
  TextEditingController contactCont = TextEditingController(text: '+91 987 6543 210');

  bool isHome = true;
  bool isWork = true;
  bool isOther = true;

  List<LSSelectionModel>? addressTypeList = [];

  int? currentTimeValue = 0;
  int? index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    addressTypeList!.add(LSSelectionModel(index: 0, title: 'Home'));
    addressTypeList!.add(LSSelectionModel(index: 1, title: 'Work'));
    addressTypeList!.add(LSSelectionModel(index: 2, title: 'Other'));
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      appBar: appBarWidget('Add Address', color: context.cardColor, center: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Area', style: secondaryTextStyle(size: 16)),
            AppTextField(
              controller: areaCont,
              textFieldType: TextFieldType.ADDRESS,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.arrow_drop_down, color: context.iconColor),
              ),
              enabled: false,
            ),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Complete Address', style: secondaryTextStyle(size: 16)),
                Text('Pin Your Location', style: boldTextStyle(color: LSColorPrimary, decoration: TextDecoration.underline)).onTap(() {
                  //
                }),
              ],
            ),
            AppTextField(
              controller: addressCont,
              textFieldType: TextFieldType.ADDRESS,
              enabled: false,
            ),
            16.height,
            Text('Contact No.', style: secondaryTextStyle(size: 16)),
            AppTextField(
              controller: contactCont,
              textFieldType: TextFieldType.PHONE,
              enabled: false,
            ),
            16.height,
            ListView.builder(
                itemCount: addressTypeList!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  LSSelectionModel data = addressTypeList![i];
                  return Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).iconTheme.color),
                    child: RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(left: 0, bottom: 0),
                      activeColor: LSColorPrimary,
                      value: i,
                      groupValue: currentTimeValue,
                      onChanged: (dynamic ind) {
                        setState(() {
                          currentTimeValue = ind;
                          index = addressTypeList![currentTimeValue.validate()].index;
                          log(index);
                        });
                      },
                      title: Text(data.title.validate(), style: primaryTextStyle()),
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
        padding: EdgeInsets.all(8),
        child: AppButton(
          text: 'Save & Continue'.toUpperCase(),
          textColor: white,
          color: LSColorPrimary,
          onTap: () {
            finish(context);
          },
        ),
      ),
    );
  }
}
