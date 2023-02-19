import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';

class AProfileLiveComponent extends StatelessWidget {
  const AProfileLiveComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: (1 / 1.5)),
      padding: EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: cookingmodal.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: commonCachedNetworkImage(
                cookingmodal[index].image.toString(),
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: SizedBox(
                height: 40,
                width: 115,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        child: ClipOval(child: commonCachedNetworkImage(cookingmodal[index].chefpic.toString(), fit: BoxFit.cover, height: 60, width: 60)),
                      ),
                      SizedBox(width: 4),
                      Text(
                        cookingmodal[index].chefname.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ).expand(),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white70.withOpacity(0.35), shape: StadiumBorder()),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 100,
              right: 16,
              child: Text(cookingmodal[index].data.toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
            ),
            Positioned(bottom: 16, right: 16, child: Icon(Icons.crop_free_outlined, color: Colors.white)),
          ],
        );
      },
    );
  }
}
