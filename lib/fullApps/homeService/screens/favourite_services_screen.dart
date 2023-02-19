import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/components/favorite_service_component.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/main.dart';

import '../models/service_provider_model.dart';

class FavouriteProvidersScreen extends StatefulWidget {
  const FavouriteProvidersScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteProvidersScreen> createState() => _FavouriteProvidersScreenState();
}

class _FavouriteProvidersScreenState extends State<FavouriteProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        title: Text(
          "Favorite Service Providers",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: appStore.isDarkModeOn ? white : black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return FavoriteServiceComponent(
            index,
            serviceProviderModel: likedProviders[index % likedProviders.length],
          );
        },
      ),
    );
  }
}
