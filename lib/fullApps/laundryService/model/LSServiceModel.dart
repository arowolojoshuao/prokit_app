import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';

class LSServiceModel {
  String? img;
  String? title;
  String? subTitle;
  String? location;
  String? rating;
  String? status;
  String? orderNo;
  String? amount;
  String? couponCode;
  int? qty;
  double? distance;
  String? date;
  bool? isSelected;

  LSServiceModel({
    this.img,
    this.title,
    this.subTitle,
    this.rating,
    this.location,
    this.status,
    this.orderNo,
    this.amount,
    this.qty,
    this.couponCode,
    this.distance,
    this.date,
    this.isSelected,
  });
}

List<LSServiceModel> getTopServiceList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'Wash & Fold', img: LSWashingClothes));
  list.add(LSServiceModel(title: 'Wash & Iren', img: LSSweatshirt));
  list.add(LSServiceModel(title: 'Dry Clean', img: LSSuit));
  list.add(LSServiceModel(title: 'premium Wash', img: LSWashingMachine));

  return list;
}

List<LSServiceModel> getNearByServiceList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'Dhobee Laundry', rating: '5', location: '1810,Camino Real ,New-york', img: LSList1));
  list.add(LSServiceModel(title: 'My Laundry', rating: '4.5', location: '1810,Camino Real ,New-york', img: LSList2));
  list.add(LSServiceModel(title: 'Quick Laundry', rating: '2', location: '1810,Camino Real ,New-york', img: LSList3));
  list.add(LSServiceModel(title: 'Your Laundry', rating: '3', location: '1810,Camino Real ,New-york', img: LSList4));
  list.add(LSServiceModel(title: 'Dhobee Laundry', rating: '5', location: '1810,Camino Real ,New-york', img: LSList1));
  list.add(LSServiceModel(title: 'My Laundry', rating: '4.5', location: '1810,Camino Real ,New-york', img: LSList2));
  list.add(LSServiceModel(title: 'Quick Laundry', rating: '2', location: '1810,Camino Real ,New-york', img: LSList3));
  list.add(LSServiceModel(title: 'Your Laundry', rating: '3', location: '1810,Camino Real ,New-york', img: LSList4));
  return list;
}

List<LSServiceModel> gwtPriceList() {
  List<LSServiceModel> list = [];
  list.add(LSServiceModel(title: 'Laundry', amount: '5', location: '1810,Camino Real ,New-york', img: LSLaundry));
  list.add(LSServiceModel(title: 'Dress', amount: '10', location: '1810,Camino Real ,New-york', img: LSDress));
  list.add(LSServiceModel(title: 'Iron', amount: '5', location: '1810,Camino Real ,New-york', img: LSIron));
  list.add(LSServiceModel(title: 'Sweatshirt', amount: '10', location: '1810,Camino Real ,New-york', img: LSSweatshirt));
  list.add(LSServiceModel(title: 'Sari', amount: '50', location: '1810,Camino Real ,New-york', img: LSSari));
  list.add(LSServiceModel(title: 'Jacket', amount: '20', location: '1810,Camino Real ,New-york', img: LSJacket));

  return list;
}

List<LSServiceModel> getOfferList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'For a Limited time', rating: '5', subTitle: 'Get 50% off', img: LSWashingClothes));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '4.5', subTitle: 'Get 50% off', img: LSWashService));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '2', subTitle: 'Get 50% off', img: LSSweatshirt));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '3', subTitle: 'Get 50% off', img: LSWashingMachine));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '5', subTitle: 'Get 50% off', img: LSWashingClothes));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '4.5', subTitle: 'Get 50% off', img: LSWashService));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '2', subTitle: 'Get 50% off', img: LSSweatshirt));
  list.add(LSServiceModel(title: 'For a Limited time', rating: '3', subTitle: 'Get 50% off', img: LSWashingMachine));
  return list;
}

List<LSServiceModel> getCatList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'Male', img: LSMen, isSelected: true));
  list.add(LSServiceModel(title: 'Female', img: LSWomen, isSelected: false));
  list.add(LSServiceModel(title: 'Bedding', img: LSBedding, isSelected: false));
  list.add(LSServiceModel(title: 'Household', img: LSHouseHold, isSelected: false));

  return list;
}

List<LSServiceModel> getBookingList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'Dhobee Laundry', amount: '474', status: 'confirmed', orderNo: '1235786535', date: 'Wed, 15 June 2019, 11:35AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'My Laundry', amount: '123', status: 'picked up', orderNo: '4567865432', date: 'Fri, 19 June 2019, 10:05AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'Quick Laundry', amount: '345', status: 'In Progress', orderNo: '5643456765', date: 'Mon, 01 July 2019, 09:35AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'Your Laundry', amount: '654', status: 'Shipped', orderNo: '8766765432', date: 'Thus, 21 July 2019, 11:35AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'Dhobee Laundry', amount: '342', status: 'Delivered', orderNo: '1234234565', date: 'Sat, 05 Aug 2019, 1:05PM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'My Laundry', amount: '179', status: 'completed', orderNo: '1239876543', date: 'Fri, 11 Sept 2019, 11:35AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'Quick Laundry', amount: '876', status: 'picked up', orderNo: '6547854389', date: 'Tus, 15 Oct 2019, 11:35AM', location: '1810,Camino Real ,New-york'));
  list.add(LSServiceModel(title: 'Your Laundry', amount: '650', status: 'Delivered', orderNo: '12345645678', date: 'Wed, 03 Nov 2019, 11:35AM', location: '1810,Camino Real ,New-york'));
  return list;
}

List<LSServiceModel> getNotificationList() {
  List<LSServiceModel> list = [];

  list.add(LSServiceModel(title: 'Your order has been cancelled', status: 'cancelled', date: '09 nov', subTitle: 'your order 12265785357 hase been cancelled by you', img: LSCancelled));
  list.add(
    LSServiceModel(
        title: 'Your order has been confirmed', status: 'confirmed', date: '4hr ago', subTitle: 'Be ready! with your clothing\'s baggage between 04:00 PM to 06:00 PM on 29 nov 2020', img: LSDelivery),
  );
  list.add(
    LSServiceModel(
        title: 'Successfully Delivered',
        status: 'successfully',
        date: '12 nov',
        subTitle: 'Hey Jhon! your order 20173293212 hase been successfully delivered to you.please help us to serve you more better services by giving feedback & rating of this order',
        img: LSWalk3),
  );
  list.add(
    LSServiceModel(
        title: 'Your order is out for delivery', status: 'delivered', date: '12 nov', subTitle: 'Delivery boy will reach to you between 12:00 PM to 02:00 PM on Monday. 10 nov 2021', img: LSShipping),
  );
  list.add(LSServiceModel(title: 'Your order is now in-process', status: 'in-process', date: '10 nov', subTitle: 'your order is in-process, it will be shipped within 48hrs.', img: LSInProgress));
  list.add(
    LSServiceModel(
        title: 'Your baggage has been picked up',
        status: 'picked-up',
        date: '10 nov',
        subTitle: 'your baggage has been picked up successfully. it will be delivered to you after 48hrs.',
        img: LSPickup),
  );
  list.add(
    LSServiceModel(
        title: 'Laundry boy is now out for pickup',
        status: 'picked-up',
        date: '10 nov',
        subTitle: 'Our staff member will reach to you between 10:00 AM to 12:00 PM on Monday, 10 nov 2021',
        img: LSPickup),
  );
  list.add(
    LSServiceModel(
        title: 'Your order has been confirmed', status: 'confirmed', date: '09 nov', subTitle: 'Be ready! with your clothing\'s baggage between 04:00 PM to 06:00 PM on 29 nov 2020', img: LSConfirm),
  );
  return list;
}
