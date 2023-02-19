import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBPickTimeBottomSheet.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBNoteDriverBottomSheet extends StatelessWidget {
  const JCBNoteDriverBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          28.height,
          Text(
            'Note to driver',
            style: boldTextStyle(size: 26, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
          ).paddingSymmetric(horizontal: 16),
          16.height,
          Text('Let driver know more about your requests.', style: secondaryTextStyle(color: context.iconColor)).paddingSymmetric(horizontal: 16),
          16.height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
              borderRadius: radius(jcbButtonRadius),
            ),
            width: context.width() - 32,
            child: AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.NAME,
              textInputAction: TextInputAction.done,
              textStyle: boldTextStyle(),
              minLines: 2,
              maxLines: 2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Eg. I\'m in front of bus stop.',
                hintStyle: boldTextStyle(color: jcbGreyColor, size: 14),
              ),
            ),
          ),
          16.height,
          AppButton(
            width: context.width() - 32,
            child: Text('Confirm'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
            onTap: () {
              finish(context);
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                  builder: (context) {
                    return JCBPickTimeBottomSheet();
                  });
            },
            color: jcbPrimaryColor,
            elevation: 0,
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
          ).paddingSymmetric(horizontal: 16),
          16.height,
        ],
      ),
    );
  }
}
