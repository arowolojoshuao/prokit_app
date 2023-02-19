import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAMoneyTransferCompeteDialog.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WARecentPayeesComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WASendViaComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/widgets/slider.dart';
import 'package:prokit_flutter/main.dart';

class WASendMoneyViaLoopScreen extends StatefulWidget {
  static String tag = '/WASendMoneyViaLoopScreen';

  @override
  WASendMoneyViaLoopScreenState createState() => WASendMoneyViaLoopScreenState();
}

class WASendMoneyViaLoopScreenState extends State<WASendMoneyViaLoopScreen> {
  TextEditingController amountController = TextEditingController(text: "\u002450");
  TextEditingController receiptNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  FocusNode receiptNameFocusNode = FocusNode();
  FocusNode accountFocusNode = FocusNode();

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    selectedCard = sendViaCardList[0];
    await Future.delayed(Duration(milliseconds: 500));
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Send Money via Loop', style: boldTextStyle(color: Colors.black, size: 20)),
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
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Send Via', style: boldTextStyle(size: 18, color: black)).paddingLeft(16),
                8.height,
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: context.width(),
                  decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedCard,
                      items: sendViaCardList.map((item) {
                        return DropdownMenuItem<WACardModel>(
                          value: item,
                          child: WASendViaComponent(item: item),
                        );
                      }).toList(),
                      onChanged: (WACardModel? value) {
                        selectedCard = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                16.height,
                Text('Recent Payees', style: boldTextStyle(size: 18, color: black)).paddingLeft(16),
                16.height,
                WARecentPayeesComponent(),
                16.height,
                Text('Amount', style: boldTextStyle(size: 18, color: black)).paddingLeft(16),
                AppTextField(
                  controller: amountController,
                  autoFocus: false,
                  textAlign: TextAlign.center,
                  textFieldType: TextFieldType.OTHER,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(fontSize: 22, color: black),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
                  ),
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 16,
                  children: List.generate(
                    amountList.length,
                    (index) {
                      return Container(
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: WAPrimaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(18)),
                        padding: EdgeInsets.only(left: 22, right: 22, top: 8, bottom: 8),
                        child: Text('\u0024${amountList[index]}', style: secondaryTextStyle(color: appStore.isDarkModeOn ? black : WAPrimaryColor)),
                      ).onTap(
                        () {
                          amountController.text = amountList[index]!;
                          setState(() {});
                        },
                      );
                    },
                  ),
                ).center(),
                16.height,
                Text("Receipt's Name", style: boldTextStyle(size: 18, color: black)).paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                    hint: "Enter receipt's name here",
                    bgColor: context.cardColor,
                    borderColor: Colors.grey,
                  ),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: receiptNameController,
                  focus: receiptNameFocusNode,
                  nextFocus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text("Receiver's Account Number", style: boldTextStyle(size: 18, color: black)).paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(hint: "Enter Receiver's name here", bgColor: context.cardColor),
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  controller: accountController,
                  focus: accountFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: false,
                  action: () {
                    showInDialog(context, builder: (context) {
                      return WAMoneyTransferCompleteDialog();
                    });
                  },
                  label: Text("Swipe for Payment", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).center(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
