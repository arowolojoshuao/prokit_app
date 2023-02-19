import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/health_medical/model/doctor_dashboard_info_model.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/common.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/constant.dart';
import 'package:prokit_flutter/main.dart';

class DoctorInfoComponent extends StatelessWidget {
  const DoctorInfoComponent({
    Key? key,
    required this.doctorData,
  }) : super(key: key);

  final DoctorDashboardInfoModel doctorData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 25,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: doctorData.containerColor, borderRadius: radius(DEFAULT_CONTAINER_RADIUS)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${doctorData.title}', style: boldTextStyle(size: 20, color: Colors.black)),
          10.height,
          richText(
            text1: 'Starting from ',
            style1: secondaryTextStyle(color: appStore.isDarkModeOn ? textSecondaryColor : null),
            text2: '${doctorData.amount}',
            style2: primaryTextStyle(color: Colors.black),
          ),
          10.height,
          AppButton(
            text: '${doctorData.actionText}',
            textStyle: primaryTextStyle(color: Colors.black),
            color: Colors.white,
            padding: EdgeInsets.all(12),
            width: context.width(),
            elevation: 0,
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }
}
