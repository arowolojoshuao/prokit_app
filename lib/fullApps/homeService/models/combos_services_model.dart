import 'common_model.dart';
import '../utils/images.dart';

List<CommonModel> combosServices = getCombosServices();

List<CommonModel> getCombosServices() {
  List<CommonModel> combosServices = [];
  combosServices.add(CommonModel.withoutIcon("Pest Control", cleaning));
  combosServices.add(CommonModel.withoutIcon("Full House Cleaning", home));
  combosServices.add(CommonModel.withoutIcon("Kitchen & Bathroom Cleaning", kitchen));
  return combosServices;
}
