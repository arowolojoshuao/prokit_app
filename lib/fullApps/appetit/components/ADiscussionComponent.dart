import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ADiscussionComponent extends StatefulWidget {
  const ADiscussionComponent({Key? key}) : super(key: key);

  @override
  State<ADiscussionComponent> createState() => _ADiscussionComponentState();
}

class _ADiscussionComponentState extends State<ADiscussionComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: discussionmodal.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //User Information
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: commonCachedNetworkImage(e.image.toString(), fit: BoxFit.cover, width: 35, height: 35),
                ),
                SizedBox(width: 8),
                Text(e.name.toString(), style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),

            //User Comment with likes and reply
            Padding(
              padding: EdgeInsets.only(left: 43.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //comment
                  Text(e.comment.toString()),

                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Row(
                          children: [
                            Icon(
                              e.isLiked.validate() ? Icons.favorite_outlined : Icons.favorite_border,
                              color: e.isLiked.validate() ? Colors.red : context.iconColor,
                            ).onTap(() {
                              e.isLiked = !e.isLiked.validate();
                              setState(() {});
                            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                            Text(e.likes.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 39,
                        child: Row(
                          children: [
                            Icon(Icons.chat_bubble_outline_outlined),
                            Text('Reply'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 8);
      }).toList(),
    );
  }
}
