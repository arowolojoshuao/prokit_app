import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/component/AppCategoryComponant.dart';
import 'package:prokit_flutter/main/component/ThemeListWeb.dart';
import 'package:prokit_flutter/main/component/WebAppBarComponent.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';

class WebComponent extends StatefulWidget {
  AppTheme appTheme = AppTheme();

  WebComponent({required this.appTheme});

  @override
  _WebComponentState createState() => _WebComponentState();
}

class _WebComponentState extends State<WebComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (_) => AnimatedContainer(
            padding: EdgeInsets.only(top: 96, left: 136),
            duration: 500.milliseconds,
            height: context.height(),
            curve: Curves.linearToEaseOut,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 40),
              child: ThemeListWeb(mainList: appStore.webListingList),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: HoverWidget(
            builder: (context, isHovering) {
              return AnimatedContainer(
                duration: 500.milliseconds,
                width: isHovering ? 240 : 100,
                curve: Curves.linearToEaseOut,
                padding: EdgeInsets.only(right: 16),
                decoration: boxDecorationDefault(boxShadow: defaultBoxShadow(), color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : white),
                child: Container(
                  padding: EdgeInsets.only(top: 60),
                  height: context.height(),
                  child: AppCategoryComponent(isHover: isHovering, appTheme: widget.appTheme),
                ),
              );
            },
          ),
        ),
        WebAppBarComponent(),
      ],
    );
  }
}
