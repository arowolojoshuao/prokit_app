import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAOperationComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAOrganizationComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAPayToComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class WABillPayScreen extends StatefulWidget {
  static String tag = '/WABillPayScreen';

  @override
  WABillPayScreenState createState() => WABillPayScreenState();
}

class WABillPayScreenState extends State<WABillPayScreen> {
  List<WABillPayModel> billPayList = waBillPayList();
  List<WAOrganizationModel> organizationList = waOrganizationList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Bill Pay',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? white : black),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: context.width(),
                  decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor),
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: billPayList.map((item) {
                      return Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                        decoration: boxDecorationRoundedWithShadow(16, backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white),
                        alignment: AlignmentDirectional.center,
                        width: context.width() * 0.25,
                        child: WAOperationComponent(
                          itemModel: item,
                          isApplyColor: true,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                30.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Organizations', style: boldTextStyle(size: 20, color: black)),
                    Container(
                      width: 100,
                      height: 50,
                      child: DropdownButtonFormField(
                        value: waOrgList[0],
                        isExpanded: true,
                        decoration: waInputDecoration(bgColor: context.cardColor, padding: EdgeInsets.symmetric(horizontal: 8)),
                        items: waOrgList.map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!, style: boldTextStyle(size: 14)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                  ],
                ),
                16.height,
                Column(
                  children: waOrganizationList().map((item) {
                    return WAOrganizationComponent(organizationModel: item).onTap(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.9,
                          maxChildSize: 0.9,
                          minChildSize: 0.3,
                          builder: (context, scrollController) => SingleChildScrollView(
                            controller: scrollController,
                            child: WAPayToComponent(organizationModel: item),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
