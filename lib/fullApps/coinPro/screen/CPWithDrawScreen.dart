import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPMyWalletScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';
import 'package:prokit_flutter/main.dart';

class CPWithDrawScreen extends StatefulWidget {
  @override
  CPWithDrawScreenState createState() => CPWithDrawScreenState();
}

class CPWithDrawScreenState extends State<CPWithDrawScreen> {
  List<CPDataModel> withDrawData = getCPWithDrawDataModel();
  TextEditingController amountController = TextEditingController();

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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CPMyWalletScreen()));
          },
          color: Color(0xff2972ff),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal)),
          textColor: Color(0xffffffff),
          height: 40,
          minWidth: MediaQuery.of(context).size.width,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Withdraw", style: boldTextStyle(size: 18)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black),
            color: Color(0xff212435),
            iconSize: 18),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Input Withdrawal Amount",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: amountController,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  prefixIcon: Icon(Icons.attach_money, color: appStore.isDarkModeOn ? white : black, size: 16),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Select Account",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 24, left: 24, top: 30, bottom: 8),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: CPCardColor),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 8,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: CPPrimaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(alignment: Alignment.bottomRight, child: Image.asset(cp_visa, width: 40, height: 40)),
                          Image.asset(cp_chip, width: 40, height: 40),
                          SizedBox(height: 24),
                          Text(
                            "654 541 645 3156",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Wade Warren",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Withdrawal Instruction",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: withDrawData.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) {
                  CPDataModel data = withDrawData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.cardName!,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff969696),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
