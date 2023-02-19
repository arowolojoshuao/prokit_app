import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVStoryModel.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:story_view/story_view.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVStoryScreen extends StatefulWidget {
  final SVStoryModel? story;

  SVStoryScreen({required this.story});

  @override
  State<SVStoryScreen> createState() => _SVStoryScreenState();
}

class _SVStoryScreenState extends State<SVStoryScreen> with TickerProviderStateMixin {
  List<String> imageList = [];
  StoryController storyController = StoryController();

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    imageList = widget.story!.storyImages.validate();
    setStatusBarColor(Colors.transparent);
    super.initState();
    init();
  }

  void init() {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StoryView(
            storyItems: [
              StoryItem.text(
                title: "I guess you'd love to see more of our food. That's great.",
                backgroundColor: Colors.blue,
              ),
              StoryItem.text(
                title: "Nice!\n\nTap to continue.",
                backgroundColor: pink,
                textStyle: TextStyle(
                  fontFamily: 'Dancing',
                  fontSize: 40,
                ),
              ),
/*          StoryItem.pageImage(
                url: "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                caption: "Still sampling",
                controller: storyController,
              ),*/
/*          StoryItem.pageImage(url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif", caption: "Working with gifs", controller: storyController),
              StoryItem.pageImage(
                url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                caption: "Hello, from the other side",
                controller: storyController,
              ),
              StoryItem.pageImage(
                url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                caption: "Hello, from the other side2",
                controller: storyController,
              ),*/
            ],
            progressPosition: ProgressPosition.top,
            repeat: false,
            controller: storyController,
          ),
          Positioned(
            left: 16,
            top: 70,
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  svCommonCachedNetworkImage(
                    widget.story!.profileImage.validate(),
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(8),
                  16.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.story!.name.validate(), style: boldTextStyle(color: Colors.white)),
                      svRobotoText(text: '${widget.story!.time.validate()} ago', color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: context.width() * 0.76,
                padding: EdgeInsets.only(left: 16, right: 4, bottom: 16),
                child: AppTextField(
                  controller: messageController,
                  textStyle: secondaryTextStyle(fontFamily: svFontRoboto, color: Colors.white),
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    hintStyle: secondaryTextStyle(fontFamily: svFontRoboto, color: Colors.white),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1.0, color: Colors.white)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1.0, color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1.0, color: Colors.white)),
                  ),
                ),
              ),
              Image.asset('images/socialv/icons/ic_Send.png', height: 24, width: 24, fit: BoxFit.cover, color: Colors.white).onTap(() {
                messageController.clear();
              }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              IconButton(
                icon: widget.story!.like.validate()
                    ? Image.asset('images/socialv/icons/ic_HeartFilled.png', height: 20, width: 22, fit: BoxFit.fill)
                    : Image.asset('images/socialv/icons/ic_Heart.png', height: 24, width: 24, fit: BoxFit.cover, color: Colors.white),
                onPressed: () {
                  widget.story!.like = !widget.story!.like.validate();
                  setState(() {});
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
