import 'package:prokit_flutter/fullApps/homeService/models/provider_services_model.dart';
import 'package:prokit_flutter/fullApps/homeService/models/services_model.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';

List<ServiceProviderModel> likedProviders = getLikedServices();

class ServiceProviderModel {
  int id;
  String name;
  String providerImage;
  String occupation;
  String star;
  String detailDescription;
  String jobs;
  String perHourPrice;
  bool isLiked;
  List<ProviderServicesModel> providerServices;

  ServiceProviderModel(this.id, this.name, this.providerImage, this.occupation, this.star, this.detailDescription, this.jobs, this.perHourPrice, this.isLiked, this.providerServices);
}

List<ServiceProviderModel> getPlumbers() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "Michel smith",
    plumber,
    "Plumbers",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "120",
    "330",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(0, "Michel John", homeCleaner, "Home Clean", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "John carter", plumber, "Plumbers", "4.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "Sammy jaine", electrician, "Electrician", "4.0", "Hi", "120", "310", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getElectricians() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(1, "Michel smith", electrician, "Electrician", "3.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Michel smith", painter1, "painter", "3.5", "Hi", "120", "150", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "John carter", homeCleaner, "Home Clean", "4.5", "Hi", "120", "220", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Carry John", plumber, "plumber", "4.0", "Hi", "120", "220", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getPainters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(2, "Michel smith", painter, "Painters", "3.5", "Hi", "120", "450", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Michel smith", painter1, "Painters", "3.5", "Hi", "120", "550", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "John carter", painter, "Painters", "4.5", "Hi", "120", "500", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Carry John", painter, "Electrician", "4.0", "Hi", "120", "550", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getCarpenters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(3, "Michel smith", carpenter, "Carpenters", "3.5", "Hi", "120", "150", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Michel smith", carpenter, "Carpenters", "3.5", "Hi", "120", "100", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "John carter", carpenter, "Carpenters", "4.5", "Hi", "120", "250", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Carry John", carpenter, "Carpenters", "4.0", "Hi", "120", "190", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getHomeCleaning() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    4,
    "John Smith",
    homeCleaner,
    "Home Cleaning",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Carry Lain",
    painter,
    "Home Painter",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "125",
    "100",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "John Carter",
    plumber,
    "Home plumber",
    "4.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "79",
    "250",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Marry John",
    homeCleaner,
    "Home Cleaning",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "90",
    "190",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Harry Potter",
    painter1,
    "Home Painter",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "100",
    "190",
    false,
    getProviderServices(),
  ));
  return list;
}

List<ServiceProviderModel> getLikedServices() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "John Smith",
    homeCleaner,
    "Home Cleaning",
    "3.5",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    1,
    "Marry John",
    painter,
    "Home Painting",
    "4.0",
    "Plumbers install and repair plumbing systems in residential and commercial properties. They also install fixtures and domestic appliances associated with heating, cooling, and sanitation systems.Plumbers install and repair plumbing systems in residential and commercial properties.",
    "90",
    "190",
    true,
    getProviderServices(),
  ));
  return list;
}

void addFavouriteProvider(int serviceIndex, int index) {
  likedProviders.add(ServiceProviderModel(
    serviceProviders[serviceIndex].serviceProviders[index].id,
    serviceProviders[serviceIndex].serviceProviders[index].name,
    serviceProviders[serviceIndex].serviceProviders[index].providerImage,
    serviceProviders[serviceIndex].serviceProviders[index].occupation,
    serviceProviders[serviceIndex].serviceProviders[index].star,
    serviceProviders[serviceIndex].serviceProviders[index].detailDescription,
    serviceProviders[serviceIndex].serviceProviders[index].jobs,
    serviceProviders[serviceIndex].serviceProviders[index].perHourPrice,
    true,
    serviceProviders[serviceIndex].serviceProviders[index].providerServices,
  ));
}

void removeFavouriteProvider(int serviceIndex, int index) {
  for (int i = 0; i < likedProviders.length; i++) {
    if (serviceProviders[serviceIndex].serviceProviders[index].name == likedProviders[i].name) {
      likedProviders.removeAt(i);
    }
  }
}
