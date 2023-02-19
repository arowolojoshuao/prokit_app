import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/main.dart';

Widget jcbBackWidget(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
    onPressed: () {
      finish(context);
    },
  );
}

Widget jcbDottedLineComponent({required double height}) {
  return Container(
    height: height,
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double boxHeight = constraints.constrainHeight();
        double dashWidth = 2.0;
        double dashHeight = 2;
        int dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: context.iconColor),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    ),
  );
}

Widget jcbTicketLineComponent(BuildContext context) {
  return SizedBox(
    height: 20,
    child: Stack(
      alignment: Alignment.center,
      children: [
        DottedLine(
          dashLength: 12,
          dashGapLength: 8,
          lineThickness: 1,
          dashColor: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor,
          direction: Axis.horizontal,
          lineLength: context.width() - 32,
        ),
        Positioned(
          child: Icon(Icons.circle, size: 20, color: jcbDarkColor),
          left: -10,
        ),
        Positioned(
          child: Icon(Icons.circle, size: 20, color: jcbDarkColor),
          right: -10,
        ),
      ],
    ),
  );
}

Widget jcbCommonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.network(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
