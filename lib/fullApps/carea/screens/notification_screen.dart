import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

import 'details_screen.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key, this.isAppbarNeeded, this.appBar}) : super(key: key);
  bool? isAppbarNeeded;
  final PreferredSizeWidget? appBar;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: (widget.isAppbarNeeded == null) ? careaAppBarWidget(context, titleText: "Notification") : widget.appBar,
        body: Container(
          padding: EdgeInsets.all(12),
          height: context.height(),
          color: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(style: boldTextStyle(size: 18), "Today"),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Your offer has been accepted", style: boldTextStyle()),
                        SizedBox(height: 10),
                        Text(
                          "Congrats! your offer has een accepted \nby the seller for 17000 rupees",
                          style: secondaryTextStyle(),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(image: car11)),
                            );
                          },
                          child: Text("View Details", style: boldTextStyle(color: white)),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.black,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.percent, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text("Yesterday", style: boldTextStyle(size: 18)),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("New Services Available!", style: boldTextStyle()),
                        SizedBox(height: 8),
                        Text("Now you can track order in real time", style: secondaryTextStyle()),
                        SizedBox(height: 8),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.black,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your offer has been rejected", style: boldTextStyle()),
                        SizedBox(height: 8),
                        Text(
                          "Were sorry, your offer has been \nrejected by the seller :(",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(image: car11)),
                            );
                          },
                          child: Text("View Details", style: boldTextStyle(color: white)),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.black,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.percent, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Credit Card Connected", style: boldTextStyle()),
                        SizedBox(height: 10),
                        Text("Credit card has been linked!", style: secondaryTextStyle()),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(image: car11)),
                            );
                          },
                          child: Text("View Details", style: boldTextStyle(color: white)),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.black,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.credit_card, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(style: boldTextStyle(size: 18), "December 22,2024"),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account setup Successful", style: boldTextStyle()),
                        SizedBox(height: 10),
                        Text("Account setup Successful", style: secondaryTextStyle()),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(image: car11)),
                            );
                          },
                          child: Text("View Details", style: boldTextStyle(color: white)),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.black,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.percent, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
