import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHViewMemberScreen extends StatefulWidget {
  final SHModel? shModel;

  SHViewMemberScreen({this.shModel});

  @override
  SHViewMemberScreenState createState() => SHViewMemberScreenState();
}

class SHViewMemberScreenState extends State<SHViewMemberScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
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
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_rounded, color: white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  //overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: [
                    commonSHCachedNetworkImage(
                      widget.shModel!.img,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ).cornerRadiusWithClipRRect(50),
                    Positioned(
                      bottom: 10,
                      left: 70,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: SHPrimaryColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined, color: white),
                        ),
                      ),
                    )
                  ],
                ).center(),
                16.height,
                Text(widget.shModel!.name!, style: boldTextStyle(color: white)),
                8.height,
                Text(widget.shModel!.subtitle!, style: secondaryTextStyle(color: grey)),
              ],
            ),
            16.height,
            Text('Access', style: boldTextStyle(color: white, size: 22)),
            16.height,
            memberAccessWidget(width: context.width(), name: 'Room'),
            16.height,
            memberAccessWidget(width: context.width(), name: 'Services'),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        height: 50,
        width: 30,
        text: 'Delete User',
        color: SHScaffoldDarkColor,
        textStyle: boldTextStyle(color: orangeRed),
        padding: EdgeInsets.only(bottom: 16),
        onTap: () async {
          SHModel data = SHModel(
            name: widget.shModel!.name,
            subtitle: widget.shModel!.subtitle,
            img: widget.shModel!.img,
          );
          await showConfirmDialog(
            context,
            'Are you sure you want to delete the user?',
            onAccept: () {
              finish(context, data);
            },
          );
        },
      ),
    );
  }
}
