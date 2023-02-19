import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';

class ASearchTopChefComponent extends StatelessWidget {
  const ASearchTopChefComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: (1 / 1.5)),
      itemCount: topchefmodal.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: commonCachedNetworkImage(
                  topchefmodal[index].image.toString(),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.25),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(topchefmodal[index].name.toString(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                  Align(alignment: Alignment.center, child: Text(topchefmodal[index].recipe.toString(), style: TextStyle(color: Colors.white, fontSize: 10))),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
