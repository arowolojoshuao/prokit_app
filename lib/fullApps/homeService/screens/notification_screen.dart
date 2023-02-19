import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';

import '../custom_widget/space.dart';
import '../utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        title: Text(
          "Notification",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Card(
                color: appStore.isDarkModeOn ? cardColorDark : cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.ac_unit_sharp, size: 20),
                      Space(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Home Hub", style: TextStyle(fontWeight: FontWeight.bold)),
                          Space(8),
                          Text(
                            "Thank you for order service using this app",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: appStore.isDarkModeOn ? Colors.white70 : Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
