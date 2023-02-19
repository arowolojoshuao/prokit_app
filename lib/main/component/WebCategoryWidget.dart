import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

int webSelectedDrawerItem = 8;

class WebCategoryWidget extends StatelessWidget {
  int id;
  Color? color;
  String? img;
  String? name;
  bool? isNew;
  String? type;
  Function(int)? onTap;

  bool? isHover;

  WebCategoryWidget(this.id, this.color, this.img, this.name, {this.isNew = false, this.type = "N", this.onTap, this.isHover});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(id),
      child: Container(
        width: context.width(),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color!.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            topRight: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: color!),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                      child: SvgPicture.asset(
                        img.validate(),
                        height: 24,
                        width: 24,
                        color: white,
                      ),
                    ),
                  ),
                  8.width,
                  AnimatedContainer(
                    duration: 1000.milliseconds,
                    curve: Curves.linearToEaseOut,
                    child: isHover.validate() ? Text(name.validate(), style: boldTextStyle()) : Offstage(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: isNew.validate() ? 12 : 20,
              right: 16,
              child: webSelectedDrawerItem == id
                  ? Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                    )
                  : Offstage(),
            ),
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 8, top: 8),
                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
                child: text(type.validate(), fontSize: 8.0, textColor: Colors.white),
              ).visible(isNew.validate()),
            ),
          ],
        ),
      ),
    );
  }
}
