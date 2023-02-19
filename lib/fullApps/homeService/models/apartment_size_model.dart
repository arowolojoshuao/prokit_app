List<ApartmentSizeModel> apartmentSizeList = getApartmentSize();

class ApartmentSizeModel {
  String size;
  bool isSelected;

  ApartmentSizeModel(
    this.size,
    this.isSelected,
  );
}

List<ApartmentSizeModel> getApartmentSize() {
  List<ApartmentSizeModel> list = [];
  list.add(ApartmentSizeModel("1 BHK", false));
  list.add(ApartmentSizeModel("2 BHK", false));
  list.add(ApartmentSizeModel("2.5 BHK", false));
  list.add(ApartmentSizeModel("3 BHK", false));
  list.add(ApartmentSizeModel("3.5 BHK", false));
  list.add(ApartmentSizeModel("4 BHK", false));
  list.add(ApartmentSizeModel("4.5 BHK", false));
  return list;
}
