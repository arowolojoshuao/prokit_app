import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';

class SHNewSceneScreen extends StatefulWidget {
  SHModel? data;

  SHNewSceneScreen({this.data});

  @override
  SHNewSceneScreenState createState() => SHNewSceneScreenState();
}

class SHNewSceneScreenState extends State<SHNewSceneScreen> {
  List<SHDeviceModel> devicesList = getAllDevicesList();
  List deviceList1 = [];
  List<String> imgList = [];

  List<String> _locations = ['Smile', 'Sad', 'Birthday', 'Emoji'];
  String? _selectedLocation;
  final addSceneKey = GlobalKey<FormState>();
  TextEditingController sceneController = TextEditingController();
  FocusNode sceneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      appBar: AppBar(
        title: Text("New Scene", style: boldTextStyle(color: white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: SHScaffoldDarkColor,
        iconTheme: IconThemeData(color: white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: boldTextStyle(color: white, size: 20)),
                8.height,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: grey, style: BorderStyle.solid, width: 0.5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text('Select Icon', style: primaryTextStyle(color: gray)),
                          value: _selectedLocation,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          isExpanded: false,
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              child: new Text(
                                location,
                                style: primaryTextStyle(color: gray),
                              ),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    16.width,
                    AppTextField(
                      textStyle: primaryTextStyle(color: white),
                      cursorColor: white,
                      controller: sceneController,
                      focus: sceneFocus,
                      textFieldType: TextFieldType.NAME,
                      decoration: buildSHInputDecoration('Scene Name'),
                      errorThisFieldRequired: 'This field is required',
                    ).expand(flex: 1),
                  ],
                ),
                28.height,
                Text("Devices", style: boldTextStyle(color: white, size: 20)),
                8.height,
                Text("Select devices to include in this room", style: secondaryTextStyle()),
              ],
            ).paddingAll(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 145,
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: devicesList.length,
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    SHDeviceModel data = devicesList[index];
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            backgroundColor: SHContainerColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                data.deviceImg.validate(),
                                fit: BoxFit.cover,
                                height: 30,
                                width: 30,
                                color: white,
                              ),
                              8.height,
                              Text(data.deviceTitle!, style: boldTextStyle(color: white)),
                              4.height,
                              Text(data.deviceSubTitle!, style: secondaryTextStyle(color: gray)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(
                            boxShape: BoxShape.circle,
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            "-",
                            style: boldTextStyle(color: white, size: 20),
                          ),
                        ).onTap(() {
                          devicesList.removeAt(index);
                          setState(() {});
                        }, borderRadius: radius(40)),
                      ],
                    );
                  },
                ),
              ),
            ),
            button(
              context: context,
              text: 'Add New Scene',
              onTap: () {
                if (sceneController.text.isEmpty) {
                  toast('please add the Scene');
                } else {
                  hideKeyboard(context);
                  log(sceneController.text);
                  SHModel data = SHModel(
                    name: sceneController.text,
                    img: 'images/shHome/music.png',
                    subtitle: '3 devices',
                  );
                  finish(context, data);
                }
              },
              textColor: white,
              width: context.width(),
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            // AppButton(
            //   text: 'Add Scene',
            //   textStyle: boldTextStyle(color: white),
            //   width: context.width(),
            //   color: SHSecondaryColor,
            //   shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
            //   onTap: () {
            //     if (sceneController.text.isEmpty) {
            //       toast('please add the Scene');
            //     } else {
            //       hideKeyboard(context);
            //       log(sceneController.text);
            //       SHModel data = SHModel(
            //         name: sceneController.text,
            //         img: 'images/shHome/music.png',
            //         subtitle: '3 devices',
            //       );
            //       finish(context, data);
            //     }
            //     // addSceneKey.currentState!.save();
            //   },
            //
            // ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
