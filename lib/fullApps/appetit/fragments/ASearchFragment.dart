import 'package:prokit_flutter/fullApps/appetit/components/APopularRecipesComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/ASearchGalleriesComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/ASearchLiveComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/components/ASearchTopChefComponent.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ASearchFragment extends StatefulWidget {
  ASearchFragment({Key? key}) : super(key: key);

  @override
  State<ASearchFragment> createState() => _ASearchFragmentState();
}

class _ASearchFragmentState extends State<ASearchFragment> with SingleTickerProviderStateMixin {
  late PageController pageController = PageController(initialPage: 0);

  var selectedItem = 0;

  void onTapAction(index) {
    setState(() => selectedItem = index);
  }

  void initState() {
    super.initState();
    afterBuildCreated(() => setStatusBarColor(context.scaffoldBackgroundColor));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          leadingWidth: 0,
          title: TextField(
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              labelText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Enter any data to search',
              prefixIcon: Icon(Icons.search_outlined, size: 24, color: Colors.grey),
              border: InputBorder.none,
              filled: true,
              contentPadding: EdgeInsets.zero,
              fillColor: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
            ),
          ).cornerRadiusWithClipRRect(16),
          elevation: 0,
          backgroundColor: context.scaffoldBackgroundColor,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: Colors.blue)),
            isScrollable: true,
            physics: AlwaysScrollableScrollPhysics(),
            tabs: searchitems
                .map((e) => Row(
                      children: [
                        commonCachedNetworkImage(e.image.toString(), height: 30, width: 30, fit: BoxFit.cover),
                        Text(e.text.toString(), style: TextStyle(color: context.iconColor)),
                      ],
                    ).paddingSymmetric(vertical: 6))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            APopularRecipesComponent(physics: AlwaysScrollableScrollPhysics()).paddingTop(16),
            ASearchLiveComponent(),
            ASearchGalleriesComponent(),
            ASearchTopChefComponent(),
          ],
        ),
      ),
    );
  }
}
