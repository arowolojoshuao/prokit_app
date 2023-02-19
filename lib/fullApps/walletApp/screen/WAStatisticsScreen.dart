import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WACategoriesComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAStatisticsChartComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/component/WAStatisticsComponent.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';

class WAStatisticScreen extends StatefulWidget {
  static String tag = '/WAStatisticScreen';

  @override
  WAStatisticScreenState createState() => WAStatisticScreenState();
}

class WAStatisticScreenState extends State<WAStatisticScreen> {
  List<WATransactionModel> categoriesList = waCategoriesList();

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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Statistics', style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                WAStatisticsComponent(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Overview', style: boldTextStyle(size: 20, color: black)),
                    16.height,
                    Container(
                      width: 100,
                      height: 50,
                      child: DropdownButtonFormField(
                        value: overViewList[0],
                        isExpanded: true,
                        decoration: waInputDecoration(bgColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 8)),
                        items: overViewList.map((String? value) {
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
                ).paddingOnly(left: 16, right: 16, top: 16),
                WAStatisticsChartComponent(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories', style: boldTextStyle(size: 20, color: black)),
                    Icon(Icons.play_arrow, color: Colors.grey),
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                Column(
                  children: categoriesList.map((categoryItem) {
                    return WACategoriesComponent(categoryModel: categoryItem);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
