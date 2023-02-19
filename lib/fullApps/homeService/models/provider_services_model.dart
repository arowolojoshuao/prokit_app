import '../utils/images.dart';

List<ProviderServicesModel> providerServices = getProviderServices();

class ProviderServicesModel {
  String serviceImage;
  String serviceName;
  int servicePrice;

  ProviderServicesModel(this.serviceImage, this.serviceName, this.servicePrice);
}

List<ProviderServicesModel> getProviderServices() {
  List<ProviderServicesModel> list = [];
  list.add(ProviderServicesModel(sofa, "Sofa Cleaning", 750));
  list.add(ProviderServicesModel(kitchen, "Kitchen Cleaning", 1000));
  list.add(ProviderServicesModel(bathroom, "Bathroom Cleaning", 1250));
  list.add(ProviderServicesModel(carpet, "Carpet Cleaning", 750));
  list.add(ProviderServicesModel(home, "Full House Cleaning", 1000));
  return list;
}
