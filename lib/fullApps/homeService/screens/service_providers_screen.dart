import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/provider_detail_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/provider_services_screen.dart';
import 'package:prokit_flutter/main.dart';

import '../custom_widget/space.dart';
import '../models/services_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class ServiceProvidersScreen extends StatefulWidget {
  final int index;

  const ServiceProvidersScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ServiceProvidersScreen> createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  Future<void> _navigateToProviderDetailScreen(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProviderDetailScreen(serviceIndex: widget.index, index: index),
      ),
    );
    if (result) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        title: Text(
          "Service Providers",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: appStore.isDarkModeOn ? white : black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: serviceProviders[widget.index].serviceProviders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToProviderDetailScreen(index);
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
                          serviceProviders[widget.index].serviceProviders[index].providerImage,
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
                              setLiked(widget.index, index);
                              setState(() {});
                            },
                            child: CircleAvatar(
                              maxRadius: 18,
                              backgroundColor: likedIconBackColor,
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: serviceProviders[widget.index].serviceProviders[index].isLiked
                                    ? Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.red,
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
                              serviceProviders[widget.index].serviceProviders[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            Space(4),
                            Text(
                              serviceProviders[widget.index].serviceProviders[index].occupation,
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
                                  serviceProviders[widget.index].serviceProviders[index].star,
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
                                SizedBox(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₹${serviceProviders[widget.index].serviceProviders[index].perHourPrice}",
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
                                      child: Text("Book", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProviderServicesScreen(serviceIndex: widget.index, index: index),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder(),
                                        backgroundColor: appStore.isDarkModeOn ? Colors.grey.withOpacity(0.2) : Colors.black,
                                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                        fixedSize: Size(140, 50),
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
        },
      ),
    );
  }
}
