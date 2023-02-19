import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class NoChatsScreen5 extends StatefulWidget {
  const NoChatsScreen5({Key? key}) : super(key: key);

  @override
  _NoChatsScreen5State createState() => _NoChatsScreen5State();
}

class _NoChatsScreen5State extends State<NoChatsScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF0ABDFF));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0ABDFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              padding: EdgeInsets.all(16),
              child: commonCachedNetworkImage('$BaseUrl/images/emptyScreen1/noChats5.png'),
              decoration: BoxDecoration(color: lightGrey.withOpacity(0.5), shape: BoxShape.circle),
            ),
            80.height,
            Text('No Chats!', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              onPressed: () {
                toast('Start Chat');
              },
              backgroundColor: white,
              child: Icon(Icons.add, size: 30, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
