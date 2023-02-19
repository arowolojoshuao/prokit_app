import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPStartScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';

import '../utils/NMPCommon.dart';

class NMPSplashScreen extends StatefulWidget {
  static String tag = '/nft_market';

  @override
  State<NMPSplashScreen> createState() => _NMPSplashScreenState();
}

class _NMPSplashScreenState extends State<NMPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    Future.delayed(Duration(seconds: 2), () {
      finish(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => NMPStartScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: commonCachedNetworkImage('$osImageBaseUrl/os_appIcon.png', height: 80, width: 80, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'NFT Market Place',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
