import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_providers_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/fullApps/homeService/models/services_model.dart';

class SearchComponent extends StatelessWidget {
  final ServicesModel? servicesModel;
  final int index;

  SearchComponent(this.index, {this.servicesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Card(
          color: transparent,
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(servicesModel!.serviceImage, width: 90, height: 90, fit: BoxFit.cover),
              ),
              Space(16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    servicesModel!.serviceName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Space(4),
                  Text(
                    servicesModel!.shortDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
