import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPStatisticScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class CPAllCoinList extends StatefulWidget {
  @override
  CPAllCoinListState createState() => CPAllCoinListState();
}

class CPAllCoinListState extends State<CPAllCoinList> {
  List<CPDataModel> tradeCryptoName = getTradeCryptoNameDataModel();

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
        backgroundColor: Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black),
          iconSize: 18,
        ),
        shape: RoundedRectangleBorder(side: BorderSide(color: Color(0x00000000), width: 1)),
        title: Text("Coin List", style: boldTextStyle(size: 18)),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: tradeCryptoName.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          CPDataModel data = tradeCryptoName[index];
          return InkWell(
            onTap: () {
              CPStatisticScreen(model: data).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                color: context.cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(0.1, 0.1),
                    blurRadius: 0.1,
                    spreadRadius: 0.1,
                  ), //BoxShadow
                  BoxShadow(color: appStore.isDarkModeOn ? transparentColor : Colors.white, offset: Offset(0.0, 0.0), blurRadius: 0.0, spreadRadius: 0.0),
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
          );
        },
      ),
    );
  }
}
