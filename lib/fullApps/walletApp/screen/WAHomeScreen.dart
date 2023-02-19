import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WACardComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAOperationComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WATransactionComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WAOperatorsScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';

class WAHomeScreen extends StatefulWidget {
  static String tag = '/WAHomeScreen';

  @override
  WAHomeScreenState createState() => WAHomeScreenState();
}

class WAHomeScreenState extends State<WAHomeScreen> {
  List<WACardModel> cardList = waCardList();
  List<WAOperationsModel> operationsList = waOperationList();
  List<WATransactionModel> transactionList = waTransactionList();

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
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: context.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Icon(Icons.person),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: context.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Icon(Icons.add_alert, color: Colors.grey),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF7426),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text('Hey Antor,', style: secondaryTextStyle(color: gray)).paddingOnly(left: 16, right: 16),
                Text('Welcome Back', style: boldTextStyle(size: 20, color: black)).paddingOnly(left: 16, right: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 16,
                    children: cardList.map((cardItem) {
                      return WACardComponent(cardModel: cardItem);
                    }).toList(),
                  ).paddingAll(16),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Operators', style: boldTextStyle(size: 20, color: black)),
                    Icon(Icons.play_arrow, color: Colors.grey).onTap(() {
                      WAOperatorsScreen().launch(context);
                    }),
                  ],
                ).paddingOnly(left: 16, right: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 16,
                    children: operationsList.map((operationModel) {
                      return WAOperationComponent(itemModel: operationModel).onTap(() {
                        operationModel.widget != null ? operationModel.widget.launch(context) : toast(operationModel.title);
                      });
                    }).toList(),
                  ).paddingAll(16),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions', style: boldTextStyle(size: 20, color: black)),
                    Icon(Icons.play_arrow, color: Colors.grey),
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Column(
                  children: transactionList.map((transactionItem) {
                    return WATransactionComponent(transactionModel: transactionItem);
                  }).toList(),
                ).paddingOnly(bottom: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
