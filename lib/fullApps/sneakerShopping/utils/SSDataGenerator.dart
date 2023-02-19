import 'package:prokit_flutter/fullApps/sneakerShopping/model/SneakerShoppingModel.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

List<SneakerShoppingModel> getAccount() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'My Order'));
  list.add(SneakerShoppingModel(name: 'Vouchers'));
  list.add(SneakerShoppingModel(name: 'Shopping Address'));
  list.add(SneakerShoppingModel(name: 'FAQ'));
  list.add(SneakerShoppingModel(name: 'Customer Services'));
  list.add(SneakerShoppingModel(name: 'Setting'));

  return list;
}

List<SneakerShoppingModel> paymentList() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Payment Option', img: 'images/sneakerShopping/ic_payment.png'));
  list.add(SneakerShoppingModel(name: 'Credit/Debit Card', img: 'images/sneakerShopping/ic_MasterCard.png'));
  list.add(SneakerShoppingModel(name: 'Paypal', img: 'images/sneakerShopping/ic_paypal.png'));

  return list;
}

List<SneakerShoppingModel> getShopping() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'New Arrival'));
  list.add(SneakerShoppingModel(name: 'Men'));
  list.add(SneakerShoppingModel(name: 'Women'));
  list.add(SneakerShoppingModel(name: 'Kids'));
  list.add(SneakerShoppingModel(name: 'Sale'));

  return list;
}

List<SneakerShoppingModel> getProductData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'All Shoes'));
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt'));
  list.add(SneakerShoppingModel(name: 'Caps'));
  list.add(SneakerShoppingModel(name: 'Accessories'));

  return list;
}

List<SneakerShoppingModel> getAllData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Men\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_5.png', amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Women\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_1.png', amount: '\$200.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Nike Air Huarache', img: 'images/sneakerShopping/ic_shoes_3.png', amount: '\$250.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'men\'s shoes', img: 'images/sneakerShopping/ic_shoes_4.png', amount: '\$350.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Nike Air Huarache', img: '$BaseUrl/images/sneakerShopping/ic_shoes_5.png', amount: '\$400.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'men\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_6.png', amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'men\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_8.png', amount: '\$100.00'));

  return list;
}

List<SneakerShoppingModel> getAllFavorite() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Men\'s shoes', img: 'images/sneakerShopping/ic_shoes_3.png', amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Women\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_10.png', amount: '\$200.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Nike Air Huarache', img: '$BaseUrl/images/sneakerShopping/ic_shoes_11.png', amount: '\$250.00'));

  return list;
}

List<SneakerShoppingModel> getAllCart() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Men\'s shoes', img: '$BaseUrl/images/sneakerShopping/ic_shoes_11.png', amount: '\$300.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Women\'s shoes', img: 'images/sneakerShopping/ic_shoes_4.png', amount: '\$200.00'));
  list.add(SneakerShoppingModel(name: 'Nike Air VaporMax Evo', subtitle: 'Nike Air Huarache', img: '$BaseUrl/images/sneakerShopping/ic_shoes_1.png', amount: '\$250.00'));

  return list;
}

List<SneakerShoppingModel> getSearchData() {
  List<SneakerShoppingModel> list = [];
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '25% OFF', img: '$BaseUrl/images/sneakerShopping/ic_arrivals_4.jpg'));
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '30% OFF', img: '$BaseUrl/images/sneakerShopping/ic_arrivals_2.jpg'));
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '70% OFF', img: '$BaseUrl/images/sneakerShopping/ic_arrivals_3.jpg'));
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '55% OFF', img: '$BaseUrl/images/sneakerShopping/ic_arrivals_4.jpg'));
  list.add(SneakerShoppingModel(name: 'Top & T-Shirt Collection', subtitle: '35% OFF', img: '$BaseUrl/images/sneakerShopping/ic_arrivals_5.jpg'));

  return list;
}
