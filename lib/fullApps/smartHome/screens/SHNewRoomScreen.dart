import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHConstant.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';

class SHNewRoomScreen extends StatefulWidget {
  List<SHDeviceModel>? list;

  SHNewRoomScreen({this.list});

  @override
  SHNewRoomScreenState createState() => SHNewRoomScreenState();
}

class SHNewRoomScreenState extends State<SHNewRoomScreen> {
  List<SHDeviceModel> devicesList = getAllDevicesList();
  TextEditingController roomTextController = TextEditingController();
  FocusNode focus = FocusNode();
  List<SHModel> homeList = getHomeList();

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
      bottomNavigationBar: button(
          context: context,
          textColor: white,
          width: context.width(),
          text: 'Add New Room',
          onTap: () {
            if (roomTextController.text.isEmpty) {
              toast('please add the room name');
            } else {
              SHDeviceModel data = SHDeviceModel(
                deviceTitle: roomTextController.text,
                deviceImg: LivingRoomImage,
                sublist: devicesList,
              );
              finish(context, data);
            }
          }).paddingSymmetric(horizontal: 16, vertical: 16),
      appBar: AppBar(
        title: Text("New Room", style: boldTextStyle(color: white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: SHScaffoldDarkColor,
        iconTheme: IconThemeData(color: white),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: boldTextStyle(color: white, size: 20)),
                  8.height,
                  AppTextField(
                    textStyle: primaryTextStyle(color: white),
                    cursorColor: white,
                    controller: roomTextController,
                    textFieldType: TextFieldType.NAME,
                    decoration: buildSHInputDecoration('Room Name'),
                    // errorThisFieldRequired: 'This field is required',
                  ),
                  28.height,
                  Text("Wallpaper", style: boldTextStyle(color: white, size: 20)),
                  8.height,
                  Text("Select wallpaper for your room", style: secondaryTextStyle()),
                  8.height,
                  AppButton(
                    width: context.width(),
                    color: SHContainerColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: white),
                        8.width,
                        Text("Add Image", style: primaryTextStyle(color: white)),
                      ],
                    ),
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
                                Image.asset(data.deviceImg.validate(), fit: BoxFit.cover, height: 30, width: 30, color: white),
                                8.height,
                                Text(data.deviceTitle!, style: boldTextStyle(color: white)),
                                4.height,
                                Text(data.deviceSubTitle!, style: secondaryTextStyle(color: gray)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: Colors.red),
                            child: Text("-", style: boldTextStyle(color: white, size: 20)),
                          ).onTap(
                            () async {
                              devicesList.removeAt(index);
                              setState(() {});
                            },
                            borderRadius: radius(defaultRadius),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
