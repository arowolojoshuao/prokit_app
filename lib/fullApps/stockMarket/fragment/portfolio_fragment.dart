import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/component/assets_component.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/constant.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/data_generator.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class PortfolioFragment extends StatefulWidget {
  @override
  _PortfolioFragmentState createState() => _PortfolioFragmentState();
}

class _PortfolioFragmentState extends State<PortfolioFragment> {
  List<StockInvestModel> assertsData = assertsList();

  TextEditingController passwordCont = TextEditingController(text: "\$18,908.00");

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(
        context,
        title: "Portfolio",
        changeIcon: true,
        showLeadingIcon: false,
        iconWidget1: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.filter_list, color: context.iconColor, size: 22),
        ),
        iconWidget2: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.bookmarks_outlined, color: context.iconColor, size: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Portfolio Balance', style: secondaryTextStyle()),
            16.height,
            SizedBox(
              width: 300,
              child: AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                controller: passwordCont,
                textStyle: boldTextStyle(size: 22),
                suffixPasswordVisibleWidget: ic_show.iconImage(size: 16).paddingAll(14),
                suffixPasswordInvisibleWidget: ic_hide.iconImage(size: 16).paddingAll(14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12, bottom: 10, top: 10, right: 10),
                  alignLabelWithHint: true,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: context.scaffoldBackgroundColor,
                ),
              ),
            ),
            16.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(right: 4),
                  decoration: boxDecorationWithRoundedCorners(
                    boxShape: BoxShape.circle,
                    backgroundColor: Colors.red,
                    border: Border.all(color: white),
                  ),
                  child: Icon(Icons.add, color: white, size: 14),
                ),
                Row(
                  children: [
                    Text("4.48% (+0.20%)", style: primaryTextStyle(color: Colors.red)),
                    8.width,
                    Text(' vs Last Week    ', style: secondaryTextStyle()),
                  ],
                ),
              ],
            ),
            24.height,
            Container(
              decoration: commonDecoration(),
              width: context.width(),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  portfolioType(image: ic_buy, portfolioTitle: "Buy/Sell").expand(),
                  Container(color: gray.withOpacity(0.3), height: 45, width: 1),
                  portfolioType(image: ic_transfer, portfolioTitle: "Transfer").expand(),
                  Container(color: gray.withOpacity(0.3), height: 45, width: 1),
                  portfolioType(image: ic_exchange, portfolioTitle: "Exchange").expand(),
                ],
              ),
            ),
            32.height,
            Text('Your Assets', style: boldTextStyle(size: headingTextSize)),
            32.height,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              padding: EdgeInsets.all(0),
              itemBuilder: (_, index) => AssetsComponent(assertsData[index % assertsData.length]).paddingOnly(bottom: 16),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
