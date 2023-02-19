import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPAllCoinList.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPMyWalletScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPQrScannerScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPStatisticScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPWidgets.dart';
import 'package:prokit_flutter/main.dart';

class CPHomeFragment extends StatefulWidget {
  @override
  CPHomeFragmentState createState() => CPHomeFragmentState();
}

class CPHomeFragmentState extends State<CPHomeFragment> {
  List<CPDataModel> tradeCrypto = getTradeCryptoDataModel();
  List<CPDataModel> tradeCryptoName = getTradeCryptoNameDataModel();
  List<CPDataModel> myPortFolio = getMyPortFolioDataModel();

  int tradIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Have you invested today?", style: boldTextStyle(size: 18)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CPQrScannerScreen()));
                },
                icon: Icon(Icons.qr_code_scanner, color: appStore.isDarkModeOn ? white : black, size: 20)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff2972ff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Your current balance",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          ),
                        ),
                        Icon(Icons.remove_red_eye_outlined, color: Color(0xffffffff), size: 22).onTap(
                          () {
                            CPMyWalletScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "\$235,554",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(height: 16, width: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        investType(icon: Icons.upgrade, text: "Deposit"),
                        investType(icon: Icons.download_outlined, text: "Withdraw"),
                        investType(icon: Icons.refresh_outlined, text: "History"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "My Portfolio",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CPAllCoinList().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    },
                    child: Text(
                      "See all",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xc42972ff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myPortFolio.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  CPDataModel data = myPortFolio[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(0.1, 0.1),
                          blurRadius: 0.2,
                          spreadRadius: 0.2,
                        ),
                        BoxShadow(color: context.cardColor, offset: Offset(0.0, 0.0), blurRadius: 0.0, spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                padding: EdgeInsets.all(8),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: data.bgColor),
                                child: Image.asset(data.image!, fit: BoxFit.cover),
                              ),
                              SizedBox(width: 16),
                              Text(
                                data.currencyUnit!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    data.totalAmount!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4, width: 16),
                                  Text(
                                    data.cardName!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffa8a8a8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16, width: 16),
                              Image(image: AssetImage(cp_chart), height: 40, width: 40, fit: BoxFit.cover),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).onTap(
                    () {
                      CPStatisticScreen(model: data).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  );
                },
              ),
            ),
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Trade Crypto",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tradeCrypto.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                itemBuilder: (context, index) {
                  CPDataModel data = tradeCrypto[index];
                  return InkWell(
                    onTap: () {
                      tradIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: tradIndex == index ? CPPrimaryColor : Colors.grey.withOpacity(0.1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        data.currencyUnit!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: tradIndex == index
                              ? Colors.white
                              : appStore.isDarkModeOn
                                  ? white
                                  : Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ).onTap(
                      () {
                        tradIndex = index;
                        setState(() {});
                      },
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: tradeCryptoName.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                CPDataModel data = tradeCryptoName[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.17,
                  secondaryActions: [Image.asset(cp_eye, height: 20, width: 20)],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      CPStatisticScreen(model: data).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: appStore.isDarkModeOn ? transparentColor : Colors.grey.withOpacity(0.4),
                            offset: Offset(0.1, 0.1),
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                          ), //BoxShadow
                          BoxShadow(
                            color: appStore.isDarkModeOn ? transparentColor : Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: data.bgColor),
                            child: Image.asset(data.image!, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 16, width: 16),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  data.currencyName!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  data.currencyUnit!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xffacacac),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data.totalAmount!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4, width: 16),
                              Container(
                                width: 65,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Color(0x1c969696),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(color: Color(0x4dfffcfc), width: 1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.1, 0.0),
                                  child: Text(
                                    data.percentage!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: data.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
