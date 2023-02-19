import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class NoChatsScreen extends StatefulWidget {
  const NoChatsScreen({Key? key}) : super(key: key);

  @override
  _NoChatsScreenState createState() => _NoChatsScreenState();
}

class _NoChatsScreenState extends State<NoChatsScreen> {
  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2D3E5E),
          onPressed: () {
            toast('Start Chat');
          },
          child: Icon(Icons.message, color: Colors.white),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/emptyScreen1/noChats.png', height: 300),
            32.height,
            Text('No Chats !', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 40),
          ],
        ),
      ),
    );
  }
}
