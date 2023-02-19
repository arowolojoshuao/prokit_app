import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';

class MentorData extends StatefulWidget {
  const MentorData({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DashBoard2DataModel data;

  @override
  State<MentorData> createState() => _MentorDataState();
}

class _MentorDataState extends State<MentorData> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      decoration: boxDecorationRoundedWithShadow(16, backgroundColor: white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            '${widget.data.image}',
            fit: BoxFit.cover,
            height: 40,
            width: 40,
          ).cornerRadiusWithClipRRect(40),
          16.width,
          Text('${widget.data.name}', textAlign: TextAlign.start, style: boldTextStyle()).expand(flex: 3),
          Text('${widget.data.categoryName}', textAlign: TextAlign.start, style: secondaryTextStyle()).expand(flex: 3),
          Text('${widget.data.courseCount} courses', textAlign: TextAlign.start, style: secondaryTextStyle()).expand(flex: 2),
          Text('${widget.data.followers} followers', textAlign: TextAlign.start, style: secondaryTextStyle()).expand(flex: 2),
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
          ).expand(flex: 2),
          8.width,
          Container(
            decoration: boxDecorationWithRoundedCorners(backgroundColor: const Color(0xFFF6F6DE)),
            child: const Icon(Icons.mail_outline_rounded),
          ).expand(flex: 1),
          PopupMenuButton(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Edit', style: primaryTextStyle()).onTap(() {
                  toasty(context, "Can't Edit");
                }),
              ),
              PopupMenuItem(
                child: Text('Delete', style: primaryTextStyle()).onTap(
                  () {
                    toast("Can't  Delete");
                  },
                ),
              ),
            ],
          ).expand(flex: 1),
        ],
      ),
    );
  }
}
