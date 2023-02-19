import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/common.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class AddCheckInScreen extends StatefulWidget {
  const AddCheckInScreen({Key? key}) : super(key: key);

  @override
  State<AddCheckInScreen> createState() => _AddCheckInScreenState();
}

class _AddCheckInScreenState extends State<AddCheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Check-in', style: boldTextStyle(size: 18)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : backgroundColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: appStore.isDarkModeOn ? Colors.black : backgroundColor,
            statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : backgroundColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('A23, World Trade Park', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                            SizedBox(height: 8),
                            Text('Business Center', style: boldTextStyle(size: 22)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Image.asset(add_check_in_image, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Share your experience', style: primaryTextStyle()),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: inputDecoration(context, hintText: 'Enter word about EV Spot'),
                          cursorColor: ev_primary_color,
                          cursorWidth: 1,
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: 'Add Photos',
                            style: primaryTextStyle(),
                            children: [
                              TextSpan(
                                text: ' (Optional)',
                                style: secondaryTextStyle(size: 16, color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurfaceVariant : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt, color: ev_primary_color),
                              SizedBox(height: 8),
                              Text(
                                'Upload photo or Video',
                                style: secondaryTextStyle(size: 16, color: appStore.isDarkModeOn ? Theme.of(context).colorScheme.onSurface : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: 'Successfully check-in',
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 16,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: appStore.isDarkModeOn ? Theme.of(context).colorScheme.surfaceVariant : Colors.black,
                    );
                  },
                  child: Text('Submit', style: primaryTextStyle(color: Colors.white)),
                  style: getElevatedButtonStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
