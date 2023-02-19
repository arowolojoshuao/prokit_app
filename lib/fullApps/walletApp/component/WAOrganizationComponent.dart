import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';

class WAOrganizationComponent extends StatefulWidget {
  static String tag = '/WAOrganizationComponent';

  final WAOrganizationModel? organizationModel;

  WAOrganizationComponent({this.organizationModel});

  @override
  WAOrganizationComponentState createState() => WAOrganizationComponentState();
}

class WAOrganizationComponentState extends State<WAOrganizationComponent> {
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
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(16),
              backgroundColor: widget.organizationModel!.color!.withOpacity(0.1),
            ),
            child: ImageIcon(AssetImage('${widget.organizationModel!.image!.validate()}'), size: 30, color: widget.organizationModel!.color!),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.organizationModel!.title.validate()}', style: boldTextStyle(), textAlign: TextAlign.center),
              4.height,
              Text('${widget.organizationModel!.subTitle.validate()}', style: secondaryTextStyle(), textAlign: TextAlign.center),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
