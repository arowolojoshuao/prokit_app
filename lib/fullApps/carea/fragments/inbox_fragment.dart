import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/components/calling_component.dart';
import 'package:prokit_flutter/fullApps/carea/components/chat_component.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class InboxFragment extends StatefulWidget {
  @override
  _InboxFragmentState createState() => _InboxFragmentState();
}

class _InboxFragmentState extends State<InboxFragment> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
          child: Icon(Icons.add, color: context.iconColor),
        ),
        appBar: careaAppBarWidget(
          context,
          titleText: "Inbox",
          actionWidget: IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.search, color: context.iconColor, size: 20),
          ),
          actionWidget2: IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.chat, color: context.iconColor, size: 20),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              unselectedLabelColor: gray.withOpacity(0.6),
              labelColor: Colors.red,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              indicatorColor: context.iconColor,
              tabs: [
                Tab(child: Text('Chats')),
                Tab(child: Text('Calls')),
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ChatComponent(),
                  CallingComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
