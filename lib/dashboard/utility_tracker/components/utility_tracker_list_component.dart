import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/model/utility_tracker_model.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/utils/colors.dart';

class UtilityTrackerListComponent extends StatelessWidget {
  const UtilityTrackerListComponent({Key? key, this.data}) : super(key: key);

  final UtilityTrackerModel? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: primaryUtilityTrackerColor, borderRadius: radius(40)),
          child: Image.asset(data!.utilityIcons!, height: 20, width: 20),
        ),
        25.height,
        Text('\u20AC ${data!.utilityAmount!}', style: boldTextStyle(size: 20, color: Colors.black)),
        8.height,
        Text('${data!.utilityTitle}', style: secondaryTextStyle(color: Colors.black)),
      ],
    );
  }
}
