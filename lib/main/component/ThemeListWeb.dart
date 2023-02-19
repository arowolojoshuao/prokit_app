import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/component/SubMenuContentComponent.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ThemeListWeb extends StatefulWidget {
  final List<ProTheme> mainList;

  ThemeListWeb({required this.mainList});

  @override
  _ThemeListWebState createState() => _ThemeListWebState();
}

class _ThemeListWebState extends State<ThemeListWeb> {
  List<ProTheme> data = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    data.addAll(widget.mainList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedWrap(
        spacing: 16,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        itemCount: widget.mainList.length,
        itemBuilder: (_, index) {
          ProTheme data = widget.mainList[index];
          bool isNew = (data.type.validate().isNotEmpty && data.isWebSupported == true);

          return HoverWidget(
            builder: (_, hovering) => AnimatedContainer(
              duration: 200.milliseconds,
              decoration: boxDecorationDefault(color: hovering ? appColorPrimary : context.cardColor),
              width: 265,
              padding: EdgeInsets.all(12),
              //margin: EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(12),
                        child: Image.asset(icons[index % icons.length], color: Colors.white),
                        decoration: boxDecorationDefault(
                          color: webColors[index % webColors.length],
                          shape: BoxShape.circle,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name.validate(),
                            style: boldTextStyle(size: 16, color: hovering ? Colors.white : null),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.height,
                          Text(
                            data.title_name.validate(),
                            style: secondaryTextStyle(size: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ).visible(data.title_name.isEmptyOrNull),
                        ],
                      ).expand()
                    ],
                  ),
                  8.height,
                  isNew
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                              decoration: data.type.validate().isNotEmpty ? boxDecoration(bgColor: appDarkRed, radius: 4) : BoxDecoration(),
                              child: text(data.type.validate(), fontSize: 10.0, textColor: Colors.white),
                            ),
                            8.height,
                            data.isWebSupported.validate()
                                ? TextIcon(
                                    edgeInsets: EdgeInsets.fromLTRB(2, 0, 8, 0),
                                    textStyle: boldTextStyle(size: 10, color: hovering ? Colors.white : Colors.green),
                                    onTap: null,
                                    text: "Web Supported",
                                    spacing: 0,
                                  )
                                : Offstage(),
                          ],
                        )
                      : Offstage(),
                ],
              ),
            ),
          ).onTap(() {
            if (data.sub_kits == null || data.sub_kits!.isEmpty) {
              //
              if (data.widget != null) {
                //
                if (data.isWebSupported.validate()) {
                  push(data.widget!, pageRouteAnimation: PageRouteAnimation.Slide, duration: 300.milliseconds);
                } else {
                  toasty(context, appComingSoon);
                }
              } else {
                toasty(context, appComingSoon);
              }
            } else {
              push(SubMenuContentComponent(proTheme: data), pageRouteAnimation: PageRouteAnimation.Fade, duration: 300.milliseconds);
            }
          }, borderRadius: radius(defaultRadius));
        },
      ),
    );
  }
}
