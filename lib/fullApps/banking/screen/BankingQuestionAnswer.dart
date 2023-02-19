import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingDataGenerator.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/main.dart';

class BankingQuestionAnswer extends StatefulWidget {
  static var tag = "/BankingQuestionAnswer";

  @override
  _BankingQuestionAnswerState createState() => _BankingQuestionAnswerState();
}

class _BankingQuestionAnswerState extends State<BankingQuestionAnswer> {
  late List<BankingQuesAnsModel> mList;

  @override
  void initState() {
    super.initState();
    mList = bankingQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_Questions_Answers, style: boldTextStyle(size: 32)),
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Question(mList[index], index);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  final BankingQuesAnsModel model;

  Question(this.model, int index);

  @override
  QuestionState createState() => new QuestionState(model);
}

class QuestionState extends State<Question> {
  bool visibility = false;
  late BankingQuesAnsModel model;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

  QuestionState(BankingQuesAnsModel model) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      decoration: boxDecorationWithShadow(
        backgroundColor: context.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: defaultBoxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        Banking_ic_Ques,
                        height: 10,
                        width: 10,
                        color: Banking_whitePureColor,
                      ).paddingAll(12),
                    ),
                    10.width,
                    Text(model.ques, style: primaryTextStyle()).expand(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        visibility == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 30,
                        color: Banking_greyColor,
                      ),
                    )
                  ],
                ).onTap(
                  () {
                    _changed();
                  },
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(Banking_lbl_Walk1SubTitle, textAlign: TextAlign.justify, style: secondaryTextStyle()),
            ),
          ),
        ],
      ),
    );
  }
}
