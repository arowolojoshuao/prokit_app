import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFormTextField.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBNoteDriverBottomSheet.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBApplyPromoBottomSheet extends StatelessWidget {
  const JCBApplyPromoBottomSheet({Key? key}) : super(key: key);

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
            'Add promo code',
            style: boldTextStyle(size: 26, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
          ).paddingSymmetric(horizontal: 16),
          16.height,
          Text('Please note that only one promo code can be applied per ride.', style: secondaryTextStyle(color: context.iconColor)).paddingSymmetric(horizontal: 16),
          16.height,
          JCBFormTextField(
            width: context.width() - 32,
            label: 'Promo Code',
            textFieldType: TextFieldType.OTHER,
            textInputAction: TextInputAction.done,
          ).paddingSymmetric(horizontal: 16),
          16.height,
          AppButton(
            width: context.width() - 32,
            child: Text('Apply Promo Code'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
            onTap: () {
              finish(context);

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                  builder: (context) {
                    return JCBNoteDriverBottomSheet();
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
