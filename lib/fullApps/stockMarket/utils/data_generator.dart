import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

List<StockInvestModel> watchList() {
  List<StockInvestModel> watchListData = [];
  watchListData.add(StockInvestModel(
      icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white),
      imageBackground: appStore.isDarkModeOn ? cardDarkColor : black,
      image: netflix,
      title: "NFLX",
      subTitle: "Netflix, Inc.",
      stockPrice: "\$303.89",
      stockScale: "1.78%",
      priceColor: greenColor));
  watchListData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: Colors.yellow, image: amazon_logo, title: "AMZN", subTitle: "Amazon, Inc.", stockPrice: "\$101.89", stockScale: "2.78%", priceColor: redColor));
  watchListData.add(StockInvestModel(
      icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white),
      imageBackground: appStore.isDarkModeOn ? cardDarkColor : black,
      image: netflix,
      title: "NFLX",
      subTitle: "Netflix, Inc.",
      stockPrice: "\$200.89",
      stockScale: "4.78%",
      priceColor: greenColor));
  watchListData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: Colors.yellow, image: amazon_logo, title: "AMZN", subTitle: "Amazon, Inc.", stockPrice: "\$300.89", stockScale: "1.50%", priceColor: redColor));
  watchListData.add(StockInvestModel(
      icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white),
      imageBackground: appStore.isDarkModeOn ? cardDarkColor : black,
      image: netflix,
      title: "NFLX",
      subTitle: "Netflix, Inc.",
      stockPrice: "\$303.89",
      stockScale: "1.78%",
      priceColor: greenColor));
  watchListData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: Colors.yellow, image: amazon_logo, title: "AMZN", subTitle: "Amazon, Inc.", stockPrice: "\$101.89", stockScale: "2.78%", priceColor: redColor));
  watchListData.add(StockInvestModel(
      icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white),
      imageBackground: appStore.isDarkModeOn ? cardDarkColor : black,
      image: netflix,
      title: "NFLX",
      subTitle: "Netflix, Inc.",
      stockPrice: "\$200.89",
      stockScale: "4.78%",
      priceColor: greenColor));
  watchListData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: Colors.yellow, image: amazon_logo, title: "AMZN", subTitle: "Amazon, Inc.", stockPrice: "\$300.89", stockScale: "1.50%", priceColor: redColor));

  return watchListData;
}

List<StockInvestModel> trendingStockList() {
  List<StockInvestModel> trendingStockData = [];
  trendingStockData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$303.89", stockScale: "1.78%", priceColor: greenColor));
  trendingStockData.add(StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$101.89", stockScale: "2.78%", priceColor: redColor));
  trendingStockData.add(
      StockInvestModel(icon: Icon(Icons.keyboard_arrow_up, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$200.89", stockScale: "4.78%", priceColor: greenColor));
  trendingStockData.add(StockInvestModel(icon: Icon(Icons.keyboard_arrow_down, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$300.89", stockScale: "1.50%", priceColor: redColor));

  return trendingStockData;
}

List<StockInvestModel> stockNewsList() {
  List<StockInvestModel> stockNewsData = [];
  stockNewsData.add(StockInvestModel(image: amd_stock, title: "Stock market LIVE updates: Sensex rises nearly 400 pts, Nifty above 18,550;", subTitle: "Buisness", stockScale: "yesterday", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: amazon_logo, title: "What's the global view on US Fed? Watch this", subTitle: "Buisness", stockScale: "49 min ago", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: netflix, title: "KM Birla is looking for buyers for 19-yr-old insurance brokerage co", subTitle: "Buisness", stockScale: "1 min ago", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: abnb_stock, title: "India could attract close to \$10 bn in renewable energy investment", subTitle: "Buisness", stockScale: "2 hours ago", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: amd_stock, title: "Stock market LIVE updates: Sensex rises nearly 400 pts, Nifty above 18,550;", subTitle: "Buisness", stockScale: "yesterday", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: amazon_logo, title: "What's the global view on US Fed? Watch this", subTitle: "Buisness", stockScale: "49 min ago", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: netflix, title: "KM Birla is looking for buyers for 19-yr-old insurance brokerage co", subTitle: "Buisness", stockScale: "1 min ago", priceColor: greenColor));
  stockNewsData.add(StockInvestModel(image: abnb_stock, title: "India could attract close to \$10 bn in renewable energy investment", subTitle: "Buisness", stockScale: "2 hours ago", priceColor: greenColor));

  return stockNewsData;
}

List<StockInvestModel> stockFutureList() {
  List<StockInvestModel> stockFutureData = [];
  stockFutureData.add(StockInvestModel(
      subTitle: "AMD", icon: Icon(Icons.add, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$303.89", stockScale: "60.0% (1.78%)", priceColor: greenColor));
  stockFutureData.add(StockInvestModel(subTitle: "ABNB", icon: Icon(Icons.remove, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$101.89", stockScale: "3.10% (2.78%)", priceColor: redColor));
  stockFutureData.add(StockInvestModel(
      subTitle: "AMD", icon: Icon(Icons.add, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$200.89", stockScale: "50.0% (4.78%)", priceColor: greenColor));
  stockFutureData.add(StockInvestModel(subTitle: "ABNB", icon: Icon(Icons.remove, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$300.89", stockScale: "1.20%(1.50%)", priceColor: redColor));
  stockFutureData.add(StockInvestModel(
      subTitle: "AMD", icon: Icon(Icons.add, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$303.89", stockScale: "60.0% (1.78%)", priceColor: greenColor));
  stockFutureData.add(StockInvestModel(subTitle: "ABNB", icon: Icon(Icons.remove, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$101.89", stockScale: "3.10% (2.78%)", priceColor: redColor));
  stockFutureData.add(StockInvestModel(
      subTitle: "AMD", icon: Icon(Icons.add, size: 10, color: white), imageBackground: appStore.isDarkModeOn ? cardDarkColor : black, image: amd_stock, title: "AMD", stockPrice: "\$200.89", stockScale: "50.0% (4.78%)", priceColor: greenColor));
  stockFutureData.add(StockInvestModel(subTitle: "ABNB", icon: Icon(Icons.remove, size: 10, color: white), imageBackground: pink, image: abnb_stock, title: "ABNB", stockPrice: "\$300.89", stockScale: "1.20%(1.50%)", priceColor: redColor));

  return stockFutureData;
}

List<StockInvestModel> sectorStockList() {
  List<StockInvestModel> sectorStockData = [];

  sectorStockData.add(StockInvestModel(image: ic_technology, title: "Technology", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_transport, title: "Transport", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_energy, title: "Energy", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_non_cylical, title: "Non-Cylical", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_industrial, title: "Industrial", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_finance, title: "Finance", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_property, title: "Property", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_Infrastruc, title: "Infrastruc", stockScale: "+0.29%", priceColor: greenColor));
  sectorStockData.add(StockInvestModel(image: ic_health, title: "Helth", stockScale: "+0.29%", priceColor: greenColor));

  return sectorStockData;
}

List<StockInvestModel> assertsList() {
  List<StockInvestModel> assertsData = [];
  assertsData.add(
    StockInvestModel(imageBackground: pink, image: netflix, title: "ABNB", subTitle: "2,8990 Share", stockPrice: "+3.50%", stockScale: "\$1,798.34%", priceColor: greenColor, profit: "\$324.78"),
  );
  assertsData.add(
    StockInvestModel(imageBackground: Colors.yellow, image: amazon_logo, title: "AMZN", subTitle: "3,8800 Share", stockPrice: "-4.40%", stockScale: "\$2,798.34%", priceColor: Colors.red, profit: "\$524.78"),
  );
  assertsData.add(
    StockInvestModel(imageBackground: mediumAquaMarine, image: netflix, title: "NTFX", subTitle: "3,8990 Share", stockPrice: "+5.50%", stockScale: "\$5,798.34%", priceColor: greenColor, profit: "\$400.78"),
  );
  assertsData.add(
    StockInvestModel(imageBackground: powderBlue, image: abnb_stock, title: "ABNB", subTitle: "2,8990 Share", stockPrice: "-3.50%", stockScale: "\$1,798.34%", priceColor: Colors.red, profit: "\$500.78"),
  );
  assertsData.add(
    StockInvestModel(imageBackground: pink, image: amd_stock, title: "AMD", subTitle: "2,8990 Share", stockPrice: "+3.50%", stockScale: "\$1,798.34%", priceColor: greenColor, profit: "\$324.78"),
  );

  return assertsData;
}

List<StockInvestModel> stockPriceList() {
  List<StockInvestModel> stockPriceData = [];

  stockPriceData.add(StockInvestModel(title: "Previous Close", stockPrice: "17.32"));
  stockPriceData.add(StockInvestModel(title: "open", stockPrice: "16.80"));
  stockPriceData.add(StockInvestModel(title: "Bid", stockPrice: "16.61 * 1000"));
  stockPriceData.add(StockInvestModel(title: "Ask", stockPrice: "16.85 * 1100"));
  stockPriceData.add(StockInvestModel(title: "Day's Range", stockPrice: "15.56 - 16.90"));
  stockPriceData.add(StockInvestModel(title: "Volume", stockPrice: "5,654.321"));

  return stockPriceData;
}

List<StockInvestModel> getProfileDataModel() {
  List<StockInvestModel> profileList = [];
  profileList.add(StockInvestModel(settingIcon: Icons.person, title: "Edit Profile"));
  profileList.add(StockInvestModel(settingIcon: Icons.notifications, title: "Notification"));
  profileList.add(StockInvestModel(settingIcon: Icons.lock, title: "Privacy & Policy"));
  profileList.add(StockInvestModel(settingIcon: Icons.question_mark, title: "Help Support"));

  return profileList;
}
