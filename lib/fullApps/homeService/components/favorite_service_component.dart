import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/fullApps/homeService/models/service_provider_model.dart';
import 'package:prokit_flutter/fullApps/homeService/models/services_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/provider_services_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class FavoriteServiceComponent extends StatefulWidget {
  final ServiceProviderModel? serviceProviderModel;

  final int index;

  FavoriteServiceComponent(this.index, {this.serviceProviderModel});

  @override
  State<FavoriteServiceComponent> createState() => _FavoriteServiceComponentState();
}

class _FavoriteServiceComponentState extends State<FavoriteServiceComponent> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appStore.isDarkModeOn ? Colors.black : Colors.grey.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.serviceProviderModel!.providerImage,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        setLiked(widget.index, widget.index);
                        setState(() {});
                      },
                      child: CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: likedIconBackColor,
                        child: SizedBox(
                          height: 14,
                          width: 14,
                          child: widget.serviceProviderModel!.isLiked
                              ? Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: redColor,
                                )
                              : Image.asset(icHeart, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Space(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.serviceProviderModel!.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Space(4),
                      Text(
                        widget.serviceProviderModel!.occupation,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: greyColor, fontSize: 14),
                      ),
                      Space(4),
                      Row(
                        children: [
                          Icon(Icons.star, color: starIconColor, size: 16),
                          Text(
                            widget.serviceProviderModel!.star,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Space(16),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("", style: TextStyle(color: blueColor, fontWeight: FontWeight.bold, fontSize: 14)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "₹${widget.serviceProviderModel!.perHourPrice}",
                                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                                  ),
                                  Text(
                                    "/hr ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                                  ),
                                ],
                              ),
                              Space(8),
                              ElevatedButton(
                                child: Text("Book", style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProviderServicesScreen(serviceIndex: widget.index, index: widget.index),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: appStore.isDarkModeOn ? Colors.grey.withOpacity(0.2) : Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                  fixedSize: Size(140, 45),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
