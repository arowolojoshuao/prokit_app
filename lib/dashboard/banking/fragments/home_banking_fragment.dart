import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/banking/components/last_month_component.dart';
import 'package:prokit_flutter/dashboard/banking/components/last_week_component.dart';
import 'package:prokit_flutter/dashboard/banking/models/banking_info_model.dart';
import 'package:prokit_flutter/dashboard/banking/utils/colors.dart';
import 'package:prokit_flutter/dashboard/banking/utils/common.dart';
import 'package:prokit_flutter/dashboard/banking/utils/images.dart';
import 'package:prokit_flutter/main.dart';

import '../utils/constant.dart';

class HomeBankingFragment extends StatefulWidget {
  @override
  _HomeBankingFragmentState createState() => _HomeBankingFragmentState();
}

class _HomeBankingFragmentState extends State<HomeBankingFragment> {
  final icons = [ic_arr_top_right, ic_add, ic_search];

  List<BankingInfoModel> setLastWeekDetail = getBankingLastWeekInfo();
  List<BankingInfoModel> setLastMonthDetail = getBankingLastMonthInfo();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(gradient: primaryLinearGradient()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 2, child: Text('Home', style: primaryTextStyle(color: Colors.white, size: 24))),
                        Wrap(
                          children: List.generate(icons.length, (index) {
                            return Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1), shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: () {
                                  //
                                },
                                icon: Image.asset(icons[index], height: 15, width: 15, color: Colors.white),
                              ),
                            );
                          }),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.1), shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                //
                              },
                              icon: Text('DP', style: primaryTextStyle(size: 16, color: Colors.white))),
                        ),
                      ],
                    ),
                    30.height,
                    Align(alignment: Alignment.centerLeft, child: Text('Total balance', style: primaryTextStyle(color: Colors.white))),
                    6.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.attach_money, color: Colors.white70, size: 20),
                        Text('2432.57', style: boldTextStyle(color: whiteColor, size: 26)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 2, child: Text('Recent', style: boldTextStyle(size: 18))),
                        TextButton(
                          onPressed: () {
                            //
                          },
                          child: Row(
                            children: [
                              Text('Show all', style: boldTextStyle(color: primaryBankingColor1, size: 14)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios_sharp, color: primaryBankingColor1, size: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    Text('LAST WEEK', style: secondaryTextStyle()),
                    10.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: radius(DEFAULT_RADIUS),
                        border: Border.all(color: appStore.isDarkModeOn ? dividerBankingBlackColor : dividerBankingColor, width: 2),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: setLastWeekDetail.length,
                        itemBuilder: (context, index) {
                          BankingInfoModel lastWeekData = setLastWeekDetail[index];
                          bool isNegativeSign = lastWeekData.lastWeekAmount!.contains('-') == true;
                          return LastWeekComponent(
                            index: index,
                            lastWeekData: lastWeekData,
                            isNegativeSign: isNegativeSign,
                            setLastWeekDetail: setLastWeekDetail,
                          );
                        },
                      ),
                    ),
                    30.height,
                    Text('LAST MONTH', style: secondaryTextStyle()),
                    10.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: radius(DEFAULT_RADIUS),
                        border: Border.all(color: appStore.isDarkModeOn ? dividerBankingBlackColor : dividerBankingColor, width: 2),
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: setLastMonthDetail.length,
                        itemBuilder: (context, index) {
                          BankingInfoModel lastMonthData = setLastMonthDetail[index];
                          bool isNegativeSign = lastMonthData.lastWeekAmount!.contains('-') == true;
                          return LastMonthComponent(
                            index: index,
                            lastMonthData: lastMonthData,
                            isNegativeSign: isNegativeSign,
                            setLastWeekDetail: setLastWeekDetail,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
