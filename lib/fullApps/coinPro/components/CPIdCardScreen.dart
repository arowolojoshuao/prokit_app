import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPLoginScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class CPIdCardScreen extends StatefulWidget {
  @override
  CPIdCardScreenState createState() => CPIdCardScreenState();
}

class CPIdCardScreenState extends State<CPIdCardScreen> {
  List<CPDataModel> cardList = getCPCardDataModel();
  int? selectCardIndex = 0;

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
      body: Align(
        alignment: Alignment(-0.1, 0.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment(-0.0, 0.1),
                      child: Text(
                        "ID Card",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Secondly you have to choose one of the \ndocuments that will be use to verify your \naccount",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cardList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        CPDataModel data = cardList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0x1fffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: appStore.isDarkModeOn ? transparentColor : Color(0x4d908f8f),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data.cardName!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ).expand(),
                              Container(
                                //   padding: EdgeInsets.all(8),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectCardIndex == index ? CPPrimaryColor : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: CPPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ).onTap(
                          () {
                            setState(() {
                              selectCardIndex = index;
                            });
                          },
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        );
                      },
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CPLoginScreen()));
                },
                color: Color(0xff2972ff),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
                ),
                textColor: Color(0xffffffff),
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
