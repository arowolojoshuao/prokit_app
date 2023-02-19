import 'package:prokit_flutter/fullApps/appetit/screens/ALoginScreen.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/ARegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class AWelcomeScreen extends StatefulWidget {
  const AWelcomeScreen({Key? key}) : super(key: key);

  @override
  _AWelcomeScreenState createState() => _AWelcomeScreenState();
}

class _AWelcomeScreenState extends State<AWelcomeScreen> {
  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.only(left: 8.0, top: 8),
          height: 50,
          width: 50,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_outlined, color: appetitBrownColor, size: 20),
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text('Appetit', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: context.iconColor)),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(top: 8, right: 8),
            width: 50,
            height: 50,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              child: Icon(Icons.help_outline_outlined, color: appetitBrownColor, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //Image with content
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/appetit/createaccount.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.darken),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create an Account', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w600)),
                  16.height,
                  Text('Create an account and login the page and for new user register the page', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            //Register using email
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ARegisterScreen())),
                style: ElevatedButton.styleFrom(primary: Color(0xFFF2894F), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined),
                    SizedBox(width: 8),
                    Text('Register using email', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),

            //Two button
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Image.asset('images/appetit/google.png', width: 70, height: 70),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        child: Image.asset('images/appetit/Apple.png', width: 60, height: 60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Have an account ? ', style: TextStyle(fontWeight: FontWeight.w300)),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ALoginScreen())),
                    child: Text('Login', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
