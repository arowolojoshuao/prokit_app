import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPStatisticScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';
import 'package:prokit_flutter/main.dart';

class CPSearchScreen extends StatefulWidget {
  @override
  CPSearchScreenState createState() => CPSearchScreenState();
}

class CPSearchScreenState extends State<CPSearchScreen> {
  List<CPDataModel> tradeCrypto = getTradeCryptoDataModel();
  List<CPDataModel> tradeCryptoName = getTradeCryptoNameDataModel();
  List<CPDataModel> myPortFolio = getMyPortFolioDataModel();

  List<String> addSearchList = ["US Dollar", "Binance Coin", "Ethereum"];

  TextEditingController searchController = TextEditingController();

  int tradIndex = 0;

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
      appBar: AppBar(
        elevation: 0,
        title: Text("Search", style: boldTextStyle(size: 18)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(side: BorderSide(color: Color(0x00000000), width: 1)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Recent Search", style: boldTextStyle()).paddingOnly(left: 16),
            16.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                obscureText: false,
                onSubmitted: (val) {
                  addSearchList.add(searchController.text);
                  setState(() {});
                  searchController.clear();
                },
                textAlign: TextAlign.left,
                maxLines: 1,
                style: primaryTextStyle(size: 14),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  hintText: "Search Here",
                  hintStyle: primaryTextStyle(size: 14),
                  filled: true,
                  isDense: false,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                ),
              ),
            ),
            8.height,
            ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (_, index) => Divider(
                color: appStore.isDarkModeOn ? white.withOpacity(0.3) : gray.withOpacity(0.3),
              ),
              itemCount: addSearchList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(addSearchList[index], style: boldTextStyle()),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: appStore.isDarkModeOn ? white : CPPrimaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
            16.height,
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Trade Crypto", style: boldTextStyle()),
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
                                    data.percentage.validate(),
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
