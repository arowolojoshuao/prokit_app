import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/health_medical/model/doctor_dashboard_info_model.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/colors.dart';

class ArticlesComponent extends StatelessWidget {
  const ArticlesComponent({
    Key? key,
    required this.articlesData,
  }) : super(key: key);

  final DoctorDashboardInfoModel articlesData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 1 - 31,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: radius(40),
            child: Image.asset(articlesData.articlesImg!, height: 50, width: 50, fit: BoxFit.cover),
          ),
          10.width,
          Text('${articlesData.articlesText}', style: primaryTextStyle()).expand(flex: 2),
          10.width,
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
            decoration: BoxDecoration(color: primaryHealthMedicalColor.withOpacity(0.1), borderRadius: radius(10)),
            child: Icon(Icons.arrow_forward, size: 24, color: primaryHealthMedicalColor),
          ),
        ],
      ),
    );
  }
}
