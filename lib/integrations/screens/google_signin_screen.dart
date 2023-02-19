import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GoogleSignInScreen extends StatefulWidget {
  static String tag = '/GoogleSignInScreen';

  @override
  GoogleSignInScreenState createState() => GoogleSignInScreenState();
}

class GoogleSignInScreenState extends State<GoogleSignInScreen> {
  var isSuccess = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  void dispose() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  void onSignInTap() async {
    await googleSignIn.signIn().then((res) async {
      await res!.authentication.then((accessToken) async {
        isSuccess = true;
        appStore.setGoogleUserName(name: res.displayName);
        appStore.setGoogleUserEmail(email: res.email);
        appStore.setGoogleUserPhotoUrl(photoUrl: res.photoUrl);
        await appStore.setValueGoogleSignIn(val: true);
        setState(() {});
        print('Access Token: ${accessToken.accessToken.toString()}');
      }).catchError((error) {
        isSuccess = false;
        setState(() {});
        throw (error.toString());
      });
    }).catchError((error) {
      isSuccess = false;
      setState(() {});
      throw (error.toString());
    });
  }

  void onSignOutTap() async {
    await googleSignIn.signOut().catchError((error) => throw (error.toString()));
    await appStore.setValueGoogleSignIn(val: false);
    appStore.setGoogleUserName(name: '');
    appStore.setGoogleUserEmail(email: '');
    appStore.setGoogleUserPhotoUrl(photoUrl: '');
    setState(() {});
  }

  Widget userDetail() {
    if (appStore.isGoogleSignedIn) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            appStore.googleUserPhotoUrl.isEmptyOrNull
                ? Image.asset('images/app/placeholder.jpg', height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(100)
                : Image.network(appStore.googleUserPhotoUrl, height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
            16.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text('${appStore.googleUserName}', fontSize: textSizeLargeMedium, fontFamily: fontSemibold, textColor: appStore.textPrimaryColor),
                  Text('${appStore.googleUserEmail}', style: secondaryTextStyle())
                  /* text(email, fontSize: textSizeLargeMedium, textColor: appStore.textPrimaryColor),*/
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Offstage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Google Sign In'),
      body: Column(
        children: <Widget>[
          userDetail(),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () async {
              if (appStore.isGoogleSignedIn) {
                onSignOutTap();
              } else {
                onSignInTap();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(24),
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.red,
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "images/integrations/icons/ic_google.png",
                    width: 30,
                    color: whiteColor,
                  ),
                  Center(child: text(appStore.isGoogleSignedIn ? 'Sign Out' : 'Sign In with google', textColor: whiteColor, isCentered: true, fontFamily: fontRegular, fontSize: textSizeMedium)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
