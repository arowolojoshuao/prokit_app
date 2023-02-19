import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/SocialIconModal.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidgetComponent extends StatefulWidget {
  const SocialMediaWidgetComponent({Key? key}) : super(key: key);

  @override
  _SocialMediaWidgetComponentState createState() => _SocialMediaWidgetComponentState();
}

class _SocialMediaWidgetComponentState extends State<SocialMediaWidgetComponent> {
  List<SocialIconModal> list = getSocialIconData();

  Widget webAndTabletWidget() {
    return Wrap(
      spacing: 8,
      children: List.generate(
        list.length,
        (index) {
          SocialIconModal data = list[index];
          return HoverWidget(
            builder: (BuildContext context, bool isHovering) {
              return Tooltip(
                message: data.iconTitle.validate(),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: 200.milliseconds,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !isHovering ? appColorPrimary : white,
                    border: Border.all(width: 1, color: appColorPrimary),
                  ),
                  child: SvgPicture.asset(
                    data.icon.validate(),
                    height: 35,
                    width: 35,
                    color: !isHovering ? white : appColorPrimary,
                  ),
                ).onTap(() {
                  launch(data.iconUrl.validate(), forceWebView: true, enableJavaScript: true);
                }),
              );
            },
          );
        },
      ),
    );
  }

  Widget mobileWidget() {
    return PopupMenuButton(
      child: Icon(Icons.menu, color: Colors.black),
      // padding: EdgeInsets.zero,
      itemBuilder: (context) {
        List<PopupMenuItem> data = [];
        list.forEach((element) {
          data.add(PopupMenuItem(
              padding: EdgeInsets.all(0),
              mouseCursor: MouseCursor.defer,
              child: HoverWidget(
                builder: (BuildContext context, bool isHovering) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: appColorPrimary),
                            child: SvgPicture.asset(
                              element.icon!,
                              height: 30,
                              width: 30,
                              color: context.scaffoldBackgroundColor,
                            ),
                          ),
                          16.width,
                          Text(element.iconTitle.validate(), style: primaryTextStyle(size: 12))
                        ],
                      ),
                    ],
                  ).onTap(() {
                    launch(element.iconUrl.validate(), forceWebView: true, enableJavaScript: true);
                  });
                },
              )));
        });
        return data;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return context.isPhone() ? mobileWidget() : webAndTabletWidget();
  }
}
