import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';

class APopularRecipesComponent extends StatefulWidget {
  ScrollPhysics? physics;

  APopularRecipesComponent({this.physics});

  @override
  State<APopularRecipesComponent> createState() => _APopularRecipesComponentState();
}

class _APopularRecipesComponentState extends State<APopularRecipesComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (1 / 1.5), mainAxisSpacing: 16, crossAxisSpacing: 16),
      physics: widget.physics ?? NeverScrollableScrollPhysics(),
      itemCount: categorymodal.length,
      padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: commonCachedNetworkImage(
                categorymodal[index].image.toString(),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.37),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black.withOpacity(0.4),
                ),
                child: IconButton(
                  onPressed: () => setState(() {
                    categorymodal[index].isBookMark = !categorymodal[index].isBookMark;
                  }),
                  icon: !categorymodal[index].isBookMark
                      ? Icon(Icons.bookmark_border_outlined, color: Colors.white.withOpacity(0.70), size: 30)
                      : Icon(Icons.bookmark, color: Colors.orange.withOpacity(0.70), size: 30),
                  // color: Colors.black.withOpacity(0.4),
                  splashRadius: 25,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black.withOpacity(0.4), shape: StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.schedule_outlined, color: Colors.white, size: 15),
                          Text(" " + categorymodal[index].views.toString(), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    categorymodal[index].data.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
