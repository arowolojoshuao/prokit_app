import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Colors.dart';

class LearnerSignUp extends StatefulWidget {
  @override
  _LearnerSignUpState createState() => _LearnerSignUpState();
}

class _LearnerSignUpState extends State<LearnerSignUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: learner_layout_background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  finish(context);
                },
                color: learner_colorPrimary,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: learner_white, width: 4)),
                          child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(learner_ic_Profile), radius: width / 8.5),
                        ),
                        SizedBox(height: 30),
                        LearnerEditTextStyle(learner_hint_full_name, isPassword: false),
                        SizedBox(height: 16),
                        LearnerEditTextStyle(learner_hint_email, isPassword: false),
                        SizedBox(height: 16),
                        LearnerEditTextStyle(learner_hint_password, isPassword: true),
                        SizedBox(height: 50),
                        Container(
                          width: 120,
                          alignment: Alignment.center,
                          child: LearnerButton(
                            onPressed: () {
                              finish(context);
                            },
                            textContent: learner_lbl_join,
                          ),
                        ),
                        16.height,
                        Text(learner_sign_up_info, style: boldTextStyle(color: appStore.textSecondaryColor)),
                        4.height,
                        Text(
                          learner_txt_terms_condition,
                          style: primaryTextStyle(decoration: TextDecoration.underline, color: t9_colorPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
