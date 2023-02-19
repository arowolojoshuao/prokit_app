import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/ChartModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/DrawerModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';

List<DrawerModel> menuDrawerList() {
  List<DrawerModel> _drawerList = [
    DrawerModel(name: 'Dashboard', icon: Ionicons.grid, onTap: () {}),
    DrawerModel(name: 'Products', icon: Ionicons.file_tray_stacked, onTap: () {}),
    DrawerModel(name: 'Transaction', icon: MaterialCommunityIcons.swap_horizontal_circle, onTap: () {}),
    DrawerModel(name: 'Overview', icon: MaterialCommunityIcons.chart_areaspline, onTap: () {}),
    DrawerModel(name: 'Customer', icon: MaterialIcons.people, onTap: () {}),
    DrawerModel(name: 'Message', icon: Ionicons.mail, count: 6, onTap: () {}),
    DrawerModel(name: 'Settings', icon: Ionicons.settings, onTap: () {}),
    DrawerModel(name: 'Log out', icon: Ionicons.log_out, onTap: () {}),
  ];
  return _drawerList;
}

List<OrderModel> getOrderList() {
  List<OrderModel> orderList = [
    OrderModel(icon: Foundation.shopping_bag, name: 'Ladies Bag', time: 05, price: 50, quantity: 50, change: 0.0),
    OrderModel(icon: MaterialIcons.watch, name: 'Ladies Watch', time: 10, price: 30, quantity: 50, change: 0.0),
    OrderModel(icon: Ionicons.shirt, name: 'T-Shirt', time: 05, price: 50, quantity: 100, change: 0.0),
    OrderModel(icon: Foundation.shopping_bag, name: 'Ladies Bag', time: 05, price: 50, quantity: 56, change: 0.0),
    OrderModel(icon: Foundation.shopping_bag, name: 'Ladies Bag', time: 05, price: 50, quantity: 10, change: 0.0),
    OrderModel(icon: Foundation.shopping_bag, name: 'Ladies Bag', time: 05, price: 50, quantity: 10, change: 0.0),
  ];
  return orderList;
}

List<OrderModel> getOrderTypeList() {
  List<OrderModel> typeList = [
    OrderModel(icon: Fontisto.pie_chart_1, name: 'New Orders', quantity: 50, change: 0.0, color: Color(0xFF5066CD)),
    OrderModel(icon: Feather.shopping_cart, name: 'Online Orders', quantity: 50, change: 0.0, color: Color(0xFF2AC54E)),
    OrderModel(icon: Feather.shopping_cart, name: 'Offline Orders', quantity: 100, change: 0.0, color: Color(0xFFE9582A)),
    OrderModel(icon: Icons.people, name: 'Total Users', quantity: 100, change: 0.0, color: Color(0xFFE0C947)),
  ];
  return typeList;
}

List<OrderModel> getTotalList() {
  List<OrderModel> totalList = [
    OrderModel(icon: Icons.point_of_sale_sharp, name: 'Total Sales', price: 400, change: 12),
    OrderModel(icon: Icons.attach_money, name: 'Total Expenses', price: 1236, change: 10),
    OrderModel(icon: FontAwesome.money, name: 'Total Revenue', price: 736, change: 3),
  ];
  return totalList;
}

List<ChartModel> chartData = [
  ChartModel(month: 'Jan', sales: 60),
  ChartModel(month: 'Feb', sales: 30),
  ChartModel(month: 'Mar', sales: 60),
  ChartModel(month: 'Apr', sales: 60),
  ChartModel(month: 'May', sales: 50),
  ChartModel(month: 'Jun', sales: 40),
  ChartModel(month: 'Jul', sales: 70),
  ChartModel(month: 'Aug', sales: 30),
  ChartModel(month: 'Sep', sales: 60),
  ChartModel(month: 'Oct', sales: 40),
  ChartModel(month: 'Nov', sales: 50),
  ChartModel(month: 'Dec', sales: 80),
];
