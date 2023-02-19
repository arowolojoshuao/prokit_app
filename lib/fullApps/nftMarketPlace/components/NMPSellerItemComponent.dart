import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/screens/NMPExpiringTopSellersScreen.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPSellerItemComponent extends StatefulWidget {
  static String tag = '/CommonWidgets';
  final OSDataModel dataModel;

  NMPSellerItemComponent(this.dataModel);

  @override
  NMPSellerItemComponentState createState() => NMPSellerItemComponentState();
}

class NMPSellerItemComponentState extends State<NMPSellerItemComponent> {
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
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NMPExpiringTopSellersScreen(widget.dataModel);
        }));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      //Use in Hot items, Expiring Soon,New top sellers content
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: commonCachedNetworkImage(
                      widget.dataModel.image!,
                      height: 170,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 182,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.dataModel.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: 182,
              height: 50,
              child: Text(widget.dataModel.subtitle!, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 182,
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      commonCachedNetworkImage('$osImageBaseUrl/icons/os_ic_token.png', width: 17, height: 17, alignment: Alignment.topCenter, color: Theme.of(context).iconTheme.color),
                      Text(widget.dataModel.price.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  IconButton(
                    icon: Row(
                      children: [
                        Icon(widget.dataModel.isSelected ? Icons.favorite : Icons.favorite_outline, color: widget.dataModel.isSelected ? Colors.red : null, size: 20),
                        SizedBox(width: 8),
                        Expanded(child: Text(widget.dataModel.like.toString(), style: TextStyle(fontSize: 12, color: Colors.grey))),
                      ],
                    ),
                    onPressed: () {
                      String s = '';
                      if (!widget.dataModel.isSelected) {
                        s = 'Liked';
                        widget.dataModel.like = widget.dataModel.like! + 1;
                      } else {
                        s = 'UnLike';
                        widget.dataModel.like = widget.dataModel.like! - 1;
                      }

                      final snackBar = SnackBar(
                        content: Text(s),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      widget.dataModel.isSelected = !widget.dataModel.isSelected;

                      setState(
                        () {
                          //   data.like = data.like! + 1;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
