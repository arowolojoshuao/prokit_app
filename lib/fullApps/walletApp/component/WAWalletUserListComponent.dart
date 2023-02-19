import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';

class WAWalletUserListComponent extends StatefulWidget {
  static String tag = '/WAWalletUserListComponent';
  final List<WAWalletUserModel>? walletUserList;

  WAWalletUserListComponent({this.walletUserList});

  @override
  WAWalletUserListComponentState createState() => WAWalletUserListComponentState();
}

class WAWalletUserListComponentState extends State<WAWalletUserListComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: context.width(),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 16),
        children: [
          DottedBorderWidget(
            radius: 28,
            padding: EdgeInsets.all(2),
            color: WAPrimaryColor,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, color: WAPrimaryColor.withOpacity(0.5)),
              child: Icon(Icons.add, color: WAPrimaryColor, size: 24),
            ),
          ),
          16.width,
          HorizontalList(
            spacing: 16,
            padding: EdgeInsets.only(right: 16),
            itemCount: widget.walletUserList!.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return waCommonCachedNetworkImage(
                widget.walletUserList![index].image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(30);
            },
          ),
        ],
      ),
    );
  }
}
