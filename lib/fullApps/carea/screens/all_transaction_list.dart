import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';

// ignore: must_be_immutable
class AllTransactionList extends StatefulWidget {
  List<CallingModel> walletData = walletDataList();

  AllTransactionList(this.walletData);

  @override
  _AllTransactionListState createState() => _AllTransactionListState();
}

class _AllTransactionListState extends State<AllTransactionList> {
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
    return Scaffold(
      appBar: careaAppBarWidget(context, titleText: "Transaction History"),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.walletData.take(7).length,
        padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 8),
        itemBuilder: (context, index) {
          CallingModel data = widget.walletData[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(listOfCarImage[index], height: 40, width: 40, color: context.iconColor, fit: BoxFit.cover),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.userName.validate(), style: boldTextStyle()),
                  8.height,
                  Text(data.subTitle.validate(), style: secondaryTextStyle()),
                ],
              ).expand(),
              Column(
                children: [
                  Text(data.countNumber.validate(), style: boldTextStyle()),
                  4.height,
                  Row(
                    children: [
                      Text(data.arriveTime.validate(), style: secondaryTextStyle()),
                      4.width,
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          backgroundColor: data.colorValue!,
                        ),
                        child: Icon(data.icon, color: white, size: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 8);
        },
      ),
    );
  }
}
