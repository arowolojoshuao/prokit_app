import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/verify_photo_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class ProofResidencyScreen extends StatefulWidget {
  @override
  _ProofResidencyScreenState createState() => _ProofResidencyScreenState();
}

class _ProofResidencyScreenState extends State<ProofResidencyScreen> {
  final List<String> proofList = ['passport', 'ID Card', 'Driver License'];
  final List<String> proofImageList = [ic_profile, ic_profile, ic_profile];

  var payment = '';

  int selectedIndex = 1;

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
      appBar: commonAppBarWidget(context, title: "", changeIcon: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Proof Of Residency', style: boldTextStyle(size: 20)).paddingOnly(left: 16),
              16.height,
              Text('What type of United State ID will you be using?', style: secondaryTextStyle()).paddingOnly(left: 16),
              32.height,
              ListView.builder(
                controller: ScrollController(),
                itemCount: proofList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                    backgroundColor: selectedIndex == index
                        ? primaryColor
                        : appStore.isDarkModeOn
                            ? cardDarkColor
                            : gray.withOpacity(0.1),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: RadioListTile(
                    visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                    title: Row(
                      children: [
                        Container(
                          decoration: boxDecorationWithRoundedCorners(
                            boxShape: BoxShape.circle,
                            backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Image.asset(
                            proofImageList[index],
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: selectedIndex == index
                                ? Colors.yellow
                                : appStore.isDarkModeOn
                                    ? white
                                    : Colors.black,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          proofList[index],
                          style: boldTextStyle(
                            color: selectedIndex == index
                                ? white
                                : appStore.isDarkModeOn
                                    ? white
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: proofList[index],
                    groupValue: payment,
                    activeColor: selectedIndex == index
                        ? white
                        : appStore.isDarkModeOn
                            ? white
                            : black,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = index;
                        payment = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Text('Choose another ID type', style: boldTextStyle()).paddingOnly(left: 16),
            ],
          ),
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By using this service, you agree to ",
                  style: secondaryTextStyle(height: 1.3),
                  children: [
                    TextSpan(
                      text: "Terms & conditions, Reward Policy ",
                      style: boldTextStyle(size: 14),
                    ),
                    TextSpan(
                      text: " and ",
                      style: secondaryTextStyle(),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: boldTextStyle(size: 14),
                    ),
                  ],
                ),
              ),
              16.height,
              CommonButton(
                  buttonText: "Continue",
                  width: context.width(),
                  margin: 16,
                  onTap: () {
                    VerifyPhotoScreen().launch(context);
                  }),
              24.height,
            ],
          )
        ],
      ),
    );
  }
}
