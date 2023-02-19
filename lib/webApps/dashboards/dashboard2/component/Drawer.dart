import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/CommanVariables.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/DashBoard2DataProvider.dart';

class drawer extends StatefulWidget {
  int selectedIndex = 0;

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  int _currentSelected = 0;
  int _currentSelected1 = 4;

  final List<DashBoard2DataModel> _menuDrawerList = menuDrawerList();
  final List<DashBoard2DataModel> _settingDrawerList = settingDrawerList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (getBoolAsync(animatedDrawer) == false) {
      _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      )..forward();
      setValue(animatedDrawer, true);
      setState(() {});
    } else {
      _controller = AnimationController(
        duration: const Duration(seconds: 0),
        vsync: this,
      )..forward();
    }
  }

  @override
  void setState(fn) {
    _controller.dispose();
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6EDDD),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Eduhouse', style: boldTextStyle(size: 24)),
            ).onTap(() {
              finish(context);
            }),
            24.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text('Main', style: secondaryTextStyle()),
            ),
            8.height,
            ListView.builder(
              itemCount: _menuDrawerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DashBoard2DataModel data = _menuDrawerList[index];
                return FadeTransition(
                  opacity: _animation,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: ClipPath(
                      child: Container(
                        decoration: boxDecorationRoundedWithShadow(
                          8,
                          backgroundColor: _currentSelected == index ? white : const Color(0xFFF6EDDD),
                        ),
                        child: SettingItemWidget(
                          onTap: () {
                            _currentSelected = index;
                            _currentSelected1 = 4;
                            log(index.toString());
                            widget.selectedIndex = index;
                            setState(() {});
                          },
                          title: '${data.name}',
                          padding: const EdgeInsets.all(8),
                          leading: Icon(
                            data.icon,
                            color: _currentSelected == index ? const Color(0xFFE8C543) : black,
                          ),
                          titleTextStyle: primaryTextStyle(
                            color: _currentSelected == index ? const Color(0xFFE8C543) : black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            16.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text('Setting', style: secondaryTextStyle()),
            ),
            8.height,
            FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: _offsetAnimation,
                child: ListView.builder(
                  itemCount: _settingDrawerList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DashBoard2DataModel data = _settingDrawerList[index];
                    return Container(
                      color: _currentSelected1 == index ? white : const Color(0xFFF6EDDD),
                      child: SettingItemWidget(
                        onTap: () {
                          _currentSelected1 = index;
                          _currentSelected = 9;
                          setState(() {});
                        },
                        padding: const EdgeInsets.all(8),
                        title: '${data.name}',
                        leading: Icon(
                          data.icon,
                          color: _currentSelected1 == index ? const Color(0xFFE8C543) : black,
                        ),
                        titleTextStyle: primaryTextStyle(
                          color: _currentSelected1 == index ? const Color(0xFFE8C543) : black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
