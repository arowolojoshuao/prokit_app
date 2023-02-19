import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/models/service_provider_model.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';

List<ServicesModel> serviceProviders = getServices();

class ServicesModel {
  int id;
  String serviceName;
  String subName;
  String shortDescription;
  String serviceImage;
  IconData serviceIcon;
  List<ServiceProviderModel> serviceProviders;
  bool isSelected;

  ServicesModel(this.id, this.serviceName, this.shortDescription, this.subName, this.serviceProviders, this.serviceImage, this.serviceIcon, {this.isSelected = false});
}

List<ServicesModel> getServices() {
  List<ServicesModel> list = List.empty(growable: true);
  list.add(ServicesModel(1, "Plumbers", "Who helps you in plumbing works", "Plumber", getPlumbers(), plumber, Icons.plumbing, isSelected: true));
  list.add(ServicesModel(2, "Electricians", "Who helps you in electrical works", "Electrician", getElectricians(), electrician, Icons.cable_outlined));
  list.add(ServicesModel(3, "Painters", "Who helps you in painting anything", "Painting", getPainters(), painter, Icons.format_paint));
  list.add(ServicesModel(4, "Carpenters", "Who helps you in carpenting works", "Carpenter", getCarpenters(), carpenter, Icons.other_houses_sharp));
  list.add(ServicesModel(5, "Home Cleaning", "Who helps you in cleaning the house", "Cleaning", getHomeCleaning(), homeCleaner, Icons.cleaning_services_sharp));
  list.add(ServicesModel(5, "Car Washers", "Who helps you in cleaning the car", "Car cleaning", getHomeCleaning(), painter1, Icons.car_repair_outlined));
  list.add(ServicesModel(6, "Car repairing", "Who helps in car repairing", "Car experts", getElectricians(), electrician, Icons.home_repair_service));
  return list;
}

void setLiked(int serviceIndex, int index) {
  if (serviceProviders[serviceIndex].serviceProviders[index].isLiked) {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = false;
    removeFavouriteProvider(serviceIndex, index);
  } else {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = true;
    addFavouriteProvider(serviceIndex, index);
  }
}
