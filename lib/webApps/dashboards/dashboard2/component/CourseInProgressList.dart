import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/CommanVariables.dart';

class CourseInProgressData extends StatefulWidget {
  const CourseInProgressData({
    Key? key,
    required this.data,
    this.itemWidth,
  }) : super(key: key);

  final DashBoard2DataModel data;
  final double? itemWidth;

  @override
  State<CourseInProgressData> createState() => _CourseInProgressDataState();
}

class _CourseInProgressDataState extends State<CourseInProgressData> with SingleTickerProviderStateMixin {
  int durationProgressIndicator = 1500;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (getBoolAsync(animated) == false) {
      durationProgressIndicator = 1500;
      setState(() {});
    } else {
      durationProgressIndicator = 0;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: context.width() * (widget.itemWidth!),
      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: widget.data.color!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Start ${widget.data.date}', style: primaryTextStyle()).expand(),
              commonCacheImageWidget(
                widget.data.image.validate(),
                40,
                fit: BoxFit.cover,
                width: 40,
              ).cornerRadiusWithClipRRect(40),
            ],
          ),
          8.height,
          Text('${widget.data.name}', style: boldTextStyle(color: widget.data.textColor)),
          16.height,
          Text('Learn ${widget.data.name} from our expert trainer', style: boldTextStyle()),
          16.height,
          Text('Finally a comprehensive guide to using sketch for designing', style: secondaryTextStyle()),
          16.height,
          LinearPercentIndicator(
            backgroundColor: white,
            animationDuration: durationProgressIndicator,
            restartAnimation: true,
            animation: true,
            animateFromLastPercent: true,
            curve: Curves.linear,
            progressColor: widget.data.progressbarColor,
            percent: widget.data.progress! / 100,
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: boldTextStyle()),
              Text('${widget.data.progress!.toInt()}%', style: secondaryTextStyle()),
            ],
          ),
        ],
      ),
    );
  }
}
