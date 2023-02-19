import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVSearchModel.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVSharePostBottomSheetComponent extends StatefulWidget {
  const SVSharePostBottomSheetComponent({Key? key}) : super(key: key);

  @override
  State<SVSharePostBottomSheetComponent> createState() => _SVSharePostBottomSheetComponentState();
}

class _SVSharePostBottomSheetComponentState extends State<SVSharePostBottomSheetComponent> {
  List<SVSearchModel> list = getSharePostList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,
        Row(
          children: [
            svCommonCachedNetworkImage('$BaseUrl/images/socialv/posts/post_one.png', height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(SVAppCommonRadius),
            10.width,
            Container(
              width: context.width() * 0.6,
              child: AppTextField(
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: 'Write A Comment',
                  hintStyle: secondaryTextStyle(color: svGetBodyColor()),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        20.height,
        Container(
          decoration: BoxDecoration(color: svGetScaffoldColor(), borderRadius: radius(SVAppCommonRadius)),
          child: AppTextField(
            textFieldType: TextFieldType.NAME,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Here',
              hintStyle: secondaryTextStyle(color: svGetBodyColor()),
              prefixIcon: Image.asset('images/socialv/icons/ic_Search.png', height: 16, width: 16, fit: BoxFit.cover, color: svGetBodyColor()).paddingAll(16),
            ),
          ),
        ),
        16.height,
        Row(
          children: [
            svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_5.png', height: 48, width: 48, fit: BoxFit.cover).cornerRadiusWithClipRRect(SVAppCommonRadius),
            10.width,
            Text('Add post to your story', style: secondaryTextStyle(color: svGetBodyColor())),
          ],
        ),
        Divider(height: 40),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: list.map((e) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    svCommonCachedNetworkImage(e.profileImage.validate(), height: 56, width: 56, fit: BoxFit.cover),
                    10.width,
                    Row(
                      children: [
                        Text(e.name.validate(), style: boldTextStyle()),
                        6.width,
                        e.isOfficialAccount.validate() ? Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover) : Offstage(),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                AppButton(
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
                  text: 'Send',
                  textStyle: secondaryTextStyle(color: e.doSend.validate() ? Colors.white : SVAppColorPrimary, size: 10),
                  onTap: () {
                    e.doSend = !e.doSend.validate();
                    setState(() {});
                  },
                  elevation: 0,
                  height: 30,
                  width: 50,
                  color: e.doSend.validate() ? SVAppColorPrimary : svGetScaffoldColor(),
                  padding: EdgeInsets.all(0),
                ),
              ],
            ).paddingSymmetric(vertical: 8);
          }).toList(),
        )
      ],
    ).paddingAll(16);
  }
}
