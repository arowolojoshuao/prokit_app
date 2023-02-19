import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';

class MentorDataTablet extends StatefulWidget {
  const MentorDataTablet({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DashBoard2DataModel data;

  @override
  MentorDataTabletState createState() => MentorDataTabletState();
}

class MentorDataTabletState extends State<MentorDataTablet> {
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
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: boxDecorationRoundedWithShadow(16, backgroundColor: white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('${widget.data.image}', fit: BoxFit.cover, height: 60, width: 60).cornerRadiusWithClipRRect(6).expand(flex: 2),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Text('${widget.data.name}', textAlign: TextAlign.center, style: boldTextStyle()),
                  Text('-${widget.data.categoryName}', textAlign: TextAlign.center, style: secondaryTextStyle()),
                  Wrap(
                    spacing: 8,
                    children: [
                      Card(
                        child: Text('${widget.data.courseCount} courses', textAlign: TextAlign.center, style: secondaryTextStyle()),
                      ),
                      Card(
                        child: Text('${widget.data.followers} followers', textAlign: TextAlign.center, style: secondaryTextStyle()),
                      ),
                    ],
                  ),
                ],
              ).expand(flex: 5),
              PopupMenuButton(
                child: const Icon(Icons.arrow_drop_down),
                padding: const EdgeInsets.all(0),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Edit', style: primaryTextStyle()).onTap(
                      () {
                        toast("Can't Edit");
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: Text('Delete', style: primaryTextStyle()).onTap(
                      () {
                        toast("Can't Delete");
                      },
                    ),
                  ),
                ],
              ).expand(flex: 1),
            ],
          ),
          8.height,
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: const Color(0xFFF9B313)),
                child: TextButton(
                  onPressed: () {
                    widget.data.following = !widget.data.following!;
                    setState(() {});
                  },
                  child: Text(widget.data.following == true ? 'Following' : 'Follow', style: boldTextStyle()),
                ),
              ).expand(flex: 4),
              8.width,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: const Color(0xFFF6F6DE)),
                child: const Icon(Icons.mail_outline_rounded),
              ).expand(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
