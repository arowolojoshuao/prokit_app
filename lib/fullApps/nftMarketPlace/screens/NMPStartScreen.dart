import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';

import '../utils/NMPCommon.dart';

class NMPStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: commonCachedNetworkImage('$osImageBaseUrl/os_appIcon.png', height: 60, width: 60, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Welcome to \nNFT Market Place',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 100,
                width: 300,
                child: Text(
                  "Discover, collect, and sell extraordinary NFTs on the world's first and & largest marketplace",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By continuing, you agree to NFT Market Place's    ",
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    TextSpan(text: " and", style: TextStyle(color: Colors.white, fontSize: 16)),
                    TextSpan(text: " Terms of Service ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(8),
                minWidth: MediaQuery.of(context).size.width - 32,
                height: 50,
                color: Colors.white,
                onPressed: () {
                  NMPDashboardScreen().launch(context);
/*                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OSDashboardScreen()),
                    (Route<dynamic> route) => false,
                  );*/
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
