import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPCommon.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class NMPAboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.iconColor),
        centerTitle: true,
        title: Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleMedium!.color)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: commonCachedNetworkImage(
                  '$osImageBaseUrl/os_about.png',
                  height: 120,
                  width: 150,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              width: 250,
              child: Text(
                'We are building an open digital economy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              padding: EdgeInsets.all(8),
              // color: Colors.yellow,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi "
                "ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
                "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint "
                "occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim "
                "id est laborum.On the other hand, we denounce with righteous indignation and dislike "
                "men who are so beguiled and demoralized by the charms of pleasure of the moment.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              color: Theme.of(context).cardColor,
              child: MaterialButton(
                height: 50,
                color: Colors.blue,
                minWidth: context.w,
                child: Text('Read more', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Terms of Service', style: TextStyle(fontSize: 14, color: Colors.blue)),
                SizedBox(width: 20),
                Icon(Icons.circle, color: Colors.grey, size: 6),
                SizedBox(width: 20),
                Text('Privacy Policy', style: TextStyle(fontSize: 14, color: Colors.blue)),
              ],
            ).paddingAll(16).paddingAll(16),
            Container(
              width: 150,
              child: Text('Version 2.1.6 Build 25', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
            Text(' © 2018-21 Extra Networks, Inc', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
