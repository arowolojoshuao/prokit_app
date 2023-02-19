import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPDataProvider.dart';

import '../utils/NMPCommon.dart';

class NMPNotableTrendingComponent extends StatefulWidget {
  static String tag = '/OnTapNotableTranding';

  final OSDataModel dataModel;

  NMPNotableTrendingComponent(this.dataModel);

  @override
  NMPNotableTrendingComponentState createState() => NMPNotableTrendingComponentState();
}

class NMPNotableTrendingComponentState extends State<NMPNotableTrendingComponent> {
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
      width: MediaQuery.of(context).size.width / 2 - 24,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: commonCachedNetworkImage(
                widget.dataModel.image!,
                // widget.dataModel.image!,
                height: 170,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.dataModel.title!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(widget.dataModel.subtitle!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      Expanded(child: Text(widget.dataModel.like.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey))),
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

                    setState(() {
                      //   data.like = data.like! + 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
