import 'package:prokit_flutter/dashboard/banking/utils/images.dart';

class BankingInfoModel {
  String? lastWeekTitle;
  String? lastWeekSubTitle;
  String? lastWeekIcons;
  String? lastWeekAmount;

  BankingInfoModel({this.lastWeekTitle, this.lastWeekSubTitle, this.lastWeekIcons, this.lastWeekAmount});
}

List<BankingInfoModel> getBankingLastWeekInfo() {
  List<BankingInfoModel> tempBankingLastWeekInfo = [];

  tempBankingLastWeekInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Uber',
      lastWeekSubTitle: '30. August',
      lastWeekIcons: ic_uber,
      lastWeekAmount: '-\$22.12',
    ),
  );

  tempBankingLastWeekInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Ebay',
      lastWeekSubTitle: '30. August',
      lastWeekIcons: ic_ebay,
      lastWeekAmount: '\$1232.23',
    ),
  );

  tempBankingLastWeekInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Pure Gym',
      lastWeekSubTitle: '28. August',
      lastWeekIcons: ic_gym,
      lastWeekAmount: '-\$82.99',
    ),
  );

  tempBankingLastWeekInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Amazon EU S.a.r.l',
      lastWeekSubTitle: '27. August',
      lastWeekIcons: ic_amazon,
      lastWeekAmount: '-\$112.50',
    ),
  );

  tempBankingLastWeekInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Nike',
      lastWeekSubTitle: '27. August',
      lastWeekIcons: ic_nike,
      lastWeekAmount: '-\$99.00',
    ),
  );

  return tempBankingLastWeekInfo;
}

List<BankingInfoModel> getBankingLastMonthInfo() {
  List<BankingInfoModel> tempBankingLastMonthInfo = [];

  tempBankingLastMonthInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Uber',
      lastWeekSubTitle: '30. August',
      lastWeekIcons: ic_uber,
      lastWeekAmount: '-\$22.12',
    ),
  );

  tempBankingLastMonthInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Ebay',
      lastWeekSubTitle: '30. August',
      lastWeekIcons: ic_ebay,
      lastWeekAmount: '\$1232.23',
    ),
  );

  tempBankingLastMonthInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Pure Gym',
      lastWeekSubTitle: '28. August',
      lastWeekIcons: ic_gym,
      lastWeekAmount: '-\$82.99',
    ),
  );

  tempBankingLastMonthInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Amazon EU S.a.r.l',
      lastWeekSubTitle: '27. August',
      lastWeekIcons: ic_amazon,
      lastWeekAmount: '-\$112.50',
    ),
  );

  tempBankingLastMonthInfo.add(
    BankingInfoModel(
      lastWeekTitle: 'Nike',
      lastWeekSubTitle: '27. August',
      lastWeekIcons: ic_nike,
      lastWeekAmount: '-\$99.00',
    ),
  );

  return tempBankingLastMonthInfo;
}
