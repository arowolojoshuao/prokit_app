import 'package:flutter/material.dart';

import 'AWalkThroughScreen.dart';

class ASplashScreen extends StatefulWidget {
  static String tag = '/appetit';

  const ASplashScreen({Key? key}) : super(key: key);

  @override
  _ASplashScreenState createState() => _ASplashScreenState();
}

class _ASplashScreenState extends State<ASplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AWalkThroughScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Text('Appetit', style: TextStyle(fontSize: 45))),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              'images/appetit/pizza2.png',
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'images/appetit/pizza1.png',
              fit: BoxFit.cover,
              height: 130,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }
}
