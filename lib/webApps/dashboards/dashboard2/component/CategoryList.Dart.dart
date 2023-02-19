import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/CommanVariables.dart';

class CategoryData extends StatefulWidget {
  const CategoryData({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DashBoard2DataModel data;

  @override
  State<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends State<CategoryData> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (getBoolAsync(animated) == false) {
      _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      )..forward();
      setValue(animated, true);
      setState(() {});
    } else {
      _controller = AnimationController(
        duration: const Duration(seconds: 0),
        vsync: this,
      )..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 8),
          // width: context.width() * 0.18,
          decoration: boxDecorationRoundedWithShadow(16, backgroundColor: white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.data.name}', style: boldTextStyle()),
                  Text('${widget.data.courseCount} courses', style: secondaryTextStyle()),
                ],
              ).expand(),
              commonCacheImageWidget(
                widget.data.image,
                40,
                fit: BoxFit.cover,
                width: 40,
              ).cornerRadiusWithClipRRect(40)
            ],
          ),
        ),
      ),
    );
  }
}
