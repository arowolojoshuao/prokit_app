import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ASearchGalleriesComponent extends StatelessWidget {
  const ASearchGalleriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: (1 / 1.5)),
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      physics: BouncingScrollPhysics(),
      itemCount: cookingmodal.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: commonCachedNetworkImage(
            cookingmodal[index].calories.toString(),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.width * 0.6,
            width: MediaQuery.of(context).size.height * 0.6,
            color: Colors.black.withOpacity(0.25),
            colorBlendMode: BlendMode.darken,
          ),
        );
      },
    );
  }
}
