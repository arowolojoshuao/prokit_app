import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';

List<CPDataModel> getCPCardDataModel() {
  List<CPDataModel> cardList = [];
  cardList.add(CPDataModel(cardName: "Identity Card"));
  cardList.add(CPDataModel(cardName: "Driver License"));
  cardList.add(CPDataModel(cardName: "Passport"));

  return cardList;
}

List<CPDataModel> getCPWithDrawDataModel() {
  List<CPDataModel> withDrawList = [];
  withDrawList.add(CPDataModel(cardName: "1. Please fill in the filed how much is the amount to the withdrawn"));
  withDrawList.add(CPDataModel(cardName: "2. select the account that will be the withdrawal target"));
  withDrawList.add(CPDataModel(cardName: "3. Click continue"));
  withDrawList.add(CPDataModel(cardName: "4. Check the information. if already correct, process and your transaction completed."));

  return withDrawList;
}

List<CPDataModel> getMyWalletDataModel() {
  List<CPDataModel> myWalletList = [];
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyName: "US Dollar", currencyUnit: "USD", totalAmount: "\$98.565", cardName: "BNB 0.447515", percentage: "+1.82%"));
  myWalletList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyName: "Binance Coin", currencyUnit: "BNB/USD", totalAmount: "\$45.589", cardName: "ETH 0.87945", percentage: "+2.70%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyName: "Ethereum", currencyUnit: "ETH/USD", totalAmount: "\$60.235", cardName: "BNB 0.16622", percentage: "+6.82%"));
  myWalletList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyName: "Uniswap", currencyUnit: "UNI/USD", totalAmount: "\$40.789", cardName: "UNI 0.748921", percentage: "-1.86%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyName: "US Dollar", currencyUnit: "USD", totalAmount: "\$98.565", cardName: "BNB 0.447515", percentage: "+5.70%"));
  myWalletList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyName: "Binance Coin", currencyUnit: "BNB/USD", totalAmount: "\$45.589", cardName: "ETH 0.87945", percentage: "+2.54%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyName: "Ethereum", currencyUnit: "ETH/USD", totalAmount: "\$60.235", cardName: "BNB 0.16622", percentage: "-1.82%"));
  myWalletList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyName: "Uniswap", currencyUnit: "UNI/USD", totalAmount: "\$40.789", cardName: "UNI 0.748921", percentage: "+2.54%"));

  return myWalletList;
}

List<CPDataModel> getNotificationDataModel() {
  List<CPDataModel> notificationList = [];
  notificationList.add(
    CPDataModel(
      // like: true,
      bgColor: CPSecondaryColor,
      image: cp_bitcoin,
      currencyName: "Bitcoin is moving up, interested in Investing? Open Coinpro now!",
      currencyUnit: "10:50 AM",
    ),
  );
  notificationList.add(
    CPDataModel(
      // like: true,
      bgColor: CPPrimaryColor.withOpacity(0.8),
      image: cp_deposit,
      currencyName: "Money deposit has been successful. Let's invest more.",
      currencyUnit: "12:35 PM",
    ),
  );
  notificationList.add(
    CPDataModel(
      // like: false,
      bgColor: CPPrimaryColor,
      image: cp_buyCoin,
      currencyName: "The Graph price is down, buy more coin now!",
      currencyUnit: "09:56 AM",
    ),
  );

  return notificationList;
}

List<CPDataModel> getTodayDateDataModel() {
  List<CPDataModel> todayDateList = [];
  todayDateList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_bitcoin, currencyName: "Bitcoin is moving up, interested in Investing? Open Coinpro now!", currencyUnit: "10:50 AM"));
  todayDateList.add(CPDataModel(bgColor: CPSecondaryColor, image: cp_deposit, currencyName: "Money deposit has been successful. Let's invest more.", currencyUnit: "12:35 PM"));

  return todayDateList;
}

List<CPDataModel> getTradeCryptoDataModel() {
  List<CPDataModel> tradeCryptoDateList = [];
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "Name"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "24h"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "My portfolio"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "Market Value"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "Name"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "24h"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "My portfolio"));
  tradeCryptoDateList.add(CPDataModel(currencyUnit: "Market Value"));

  return tradeCryptoDateList;
}

List<CPDataModel> getTradeCryptoNameDataModel() {
  List<CPDataModel> tradeCryptoNameList = [];
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyName: "US Dollar", currencyUnit: "USD", totalAmount: "\$98.565", percentage: "+1.82%", textColor: CPPlusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyName: "Binance Coin", currencyUnit: "BNB/USD", totalAmount: "\$45.589", percentage: "+2.70%", textColor: CPPlusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyName: "Ethereum", currencyUnit: "ETH/USD", totalAmount: "\$60.235", percentage: "+6.82%", textColor: CPPlusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyName: "Uniswap", currencyUnit: "UNI/USD", totalAmount: "\$40.789", percentage: "-1.86%", textColor: CPMinusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyName: "US Dollar", currencyUnit: "USD", totalAmount: "\$98.565", percentage: "+5.70%", textColor: CPPlusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyName: "Binance Coin", currencyUnit: "BNB/USD", totalAmount: "\$45.589", percentage: "+2.54%", textColor: CPPlusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyName: "Ethereum", currencyUnit: "ETH/USD", totalAmount: "\$60.235", percentage: "-1.82%", textColor: CPMinusCoinPer));
  tradeCryptoNameList
      .add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyName: "Uniswap", currencyUnit: "UNI/USD", totalAmount: "\$40.789", percentage: "-3.82%", textColor: CPMinusCoinPer));

  return tradeCryptoNameList;
}

List<CPDataModel> getMyPortFolioDataModel() {
  List<CPDataModel> myWalletList = [];
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyUnit: "USD", totalAmount: "\$98.565", cardName: "BNB 0.447515", percentage: "+1.82%"));
  myWalletList.add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyUnit: "BNB/USD", totalAmount: "\$45.589", cardName: "ETH 0.87945", percentage: "+2.70%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyUnit: "ETH/USD", totalAmount: "\$60.235", cardName: "BNB 0.16622", percentage: "+6.82%"));
  myWalletList.add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyUnit: "UNI/USD", totalAmount: "\$40.789", cardName: "UNI 0.748921", percentage: "-1.86%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_dollar, currencyUnit: "USD", totalAmount: "\$98.565", cardName: "BNB 0.447515", percentage: "+5.70%"));
  myWalletList.add(CPDataModel(bgColor: CPSecondaryColor, image: cp_binance, currencyUnit: "BNB/USD", totalAmount: "\$45.589", cardName: "ETH 0.87945", percentage: "+2.54%"));
  myWalletList.add(CPDataModel(bgColor: CPPrimaryColor, image: cp_ethereum, currencyUnit: "ETH/USD", totalAmount: "\$60.235", cardName: "BNB 0.16622", percentage: "-1.82%"));
  myWalletList.add(CPDataModel(bgColor: CPSecondaryColor, image: cp_uniSwap, currencyUnit: "UNI/USD", totalAmount: "\$40.789", cardName: "UNI 0.748921", percentage: "-3.82%"));

  return myWalletList;
}

List<CPDataModel> getProfileDataModel() {
  List<CPDataModel> profileList = [];
  profileList.add(CPDataModel(icon: Icons.person, currencyUnit: "Edit Profile"));
  profileList.add(CPDataModel(icon: Icons.notifications, currencyUnit: "Notification"));
  profileList.add(CPDataModel(icon: Icons.lock, currencyUnit: "Privacy & Policy"));
  profileList.add(CPDataModel(icon: Icons.settings, currencyUnit: "Setting"));

  return profileList;
}

List dataList = [
  [1640602200000, "295584.06862172892624670300851191118"],
  [1640602800000, "295524.61961831227706042934089122698"],
  [1640603400000, "295842.94899272656681012288341924714"],
  [1640604000000, "296175.24067366911894248658377356944"],
  [1640604600000, "296334.19050887864934253832927933835"],
  [1640605200000, "296403.16155879641363785370412487275"],
  [1640605800000, "295421.75528841249219963510282330153"],
  [1640606400000, "294044.25941873464388378127101952589"],
  [1640607000000, "292757.662567795882289362794508768"],
  [1640607600000, "293100.3983888194308920516212432503"],
  [1640608200000, "294275.1089394163147308991363987564"],
  [1640608800000, "295460.85762006513455330044830465818"],
  [1640609400000, "296698.91232769453006126845688373964"],
  [1640610000000, "297592.37456331634813564904098399429"],
  [1640610600000, "297786.43665265695549194078959886992"],
  [1640611200000, "299095.68985047323430018515103213722"],
  [1640611800000, "299709.56423987960624132626600980329"],
  [1640612400000, "301159.51969617201822301458129931959"],
  [1640613000000, "302039.83756553952963842085428687323"],
  [1640613600000, "302949.05728951602891856463421444919"],
  [1640614200000, "304262.3223397441790432873596148456"],
  [1640614800000, "304379.84556916739584249768789585912"],
  [1640615400000, "306041.73673087260123201374759588786"],
  [1640616000000, "307000.28421752283656273173809159367"],
  [1640616600000, "308324.08092979394864589254685819167"],
  [1640617200000, "309384.99066935064304104062594296114"],
  [1640617800000, "310073.58306987375981593678274765074"],
  [1640618400000, "311452.74455634428570633319077983865"],
  [1640619000000, "311353.37914764668807178593829607077"],
  [1640619600000, "311243.33546008742963251166985075012"],
  [1640620200000, "310922.57915237695779603122087194313"],
  [1640620800000, "311492.13456396235560548738178911092"],
  [1640621400000, "312026.11404908369057092860135995572"],
  [1640622000000, "312505.6483163730890206837744127696"],
  [1640622600000, "314266.4605177011144517579623865637"],
  [1640623200000, "314380.8118396918939012469075205134"],
  [1640623800000, "314515.65391386228733849174282181419"],
  [1640624400000, "314301.78204669113223660644696736959"],
  [1640625000000, "314391.571927492550742732362885726"],
  [1640625600000, "314813.5546470690837955978200438997"],
  [1640626200000, "316036.45520939786682057434819101817"],
  [1640626800000, "316438.40375813518964312811691699206"],
  [1640627400000, "318519.74646471809732071246954746166"],
  [1640628000000, "319462.30275203868898901524952681554"],
  [1640628600000, "319761.12441214849103449844190369164"],
  [1640629200000, "321387.71031984393517132886914228912"],
  [1640629800000, "322303.28906517581069109173164857039"],
  [1640630400000, "324272.22193957500120270814426467065"],
  [1640631000000, "325116.3947265844079761826173451103"],
  [1640631600000, "325721.4469998016452152085784501746"],
  [1640632200000, "326021.63266067541407196669914813372"],
  [1640632800000, "326255.8861838354412699124084245881"],
  [1640633400000, "327577.23901207963665143921381799076"],
  [1640634000000, "328291.7357823707024794636221294003"],
  [1640634600000, "329337.4292012948501427103560967287"],
  [1640635200000, "330617.8679995493708605462367594329"],
  [1640635800000, "332179.06452639224199115802803884011"],
  [1640636400000, "333999.11938775027321422115536862081"],
  [1640637000000, "334792.35197175381075759950911731169"],
  [1640637600000, "336024.93265914345309094822668910726"],
  [1640638200000, "336863.16324485025501090036116582616"],
  [1640638800000, "338092.82960620342379884916249672316"],
  [1640639400000, "339269.05166452139568392295514882586"],
  [1640640000000, "338946.64094171455065975446357559337"],
  [1640640600000, "338027.10076318812394883437345182643"],
  [1640641200000, "337574.13498957864244633093496339113"],
  [1640641800000, "336010.03017171616649501794682308487"],
  [1640642400000, "337011.75053288407495714411009901898"],
  [1640643000000, "337807.79633617851351301053329515058"],
  [1640643600000, "338503.93644935106479923049827460011"],
  [1640644200000, "339403.83879484703823359589463689145"],
  [1640644800000, "340280.69139634568369236741334543492"],
  [1640645400000, "341934.66245777569093500383264572822"],
  [1640646000000, "344435.92731537443318882846169359794"],
  [1640646600000, "346104.38137761274024804629832832564"],
  [1640647200000, "346572.651644113953200864840725249"],
  [1640647800000, "347687.7007897716644956366511103232"],
  [1640648400000, "348746.97624164552642152363378415426"],
  [1640649000000, "350210.50788804799363574184779194218"],
  [1640649600000, "351722.54554764025912395673048677428"],
  [1640650200000, "354379.27648196032234770528266121196"],
  [1640650800000, "358466.09968860439121848739563777317"],
  [1640651400000, "363470.62583841870261877800479956477"],
  [1640652000000, "366516.06483651964340962908175659732"],
  [1640652600000, "368753.33372344408312360671295038139"],
  [1640653200000, "370820.46519739642498780525420553926"],
  [1640653800000, "371980.07654774961886802474346065026"],
  [1640654400000, "373070.99973704984056072474516792356"],
  [1640655000000, "374537.95849810735354669575707168239"],
  [1640655600000, "376381.24569601275482246635815977218"],
  [1640656200000, "381719.57440769227092350659902231238"],
  [1640656800000, "383722.75291297253734223360462937728"],
  [1640657400000, "386684.83864186962508317158945726018"],
  [1640658000000, "387939.51919163834980544342382709624"],
  [1640658600000, "389736.83785380513541624671543304934"],
  [1640659200000, "391034.47070097893544802687800637153"],
  [1640659800000, "392292.84130105779660216703170981213"],
  [1640660400000, "393641.07046468649616929887302202147"],
  [1640661000000, "393985.05033558141859547759962448956"],
  [1640661600000, "397710.3791893604838987290155270206"],
  [1640662200000, "399534.96397438119978757977396110988"],
  [1640662800000, "402058.61128818557698124346443787786"],
  [1640663400000, "403346.40840785939101481128464280538"],
  [1640664000000, "403713.1085958527512853350314900746"],
  [1640664600000, "404921.12666047639388299619666028721"],
  [1640665200000, "405445.35987393426980712180259431251"],
  [1640665800000, "414466.42186663806572565730304948001"],
  [1640666400000, "421567.80931407667405961315378818262"],
  [1640667000000, "425206.00021294090103319088816460842"],
  [1640667600000, "428107.0930437719832771255672024021"],
  [1640668200000, "428690.35205183313638357524538428335"],
  [1640668800000, "429436.68563571872497374615597951745"],
  [1640669400000, "430768.10912511555413628997228480427"],
  [1640670000000, "431845.06817332672288119207701485715"],
  [1640670600000, "432710.18688406432707268757533889636"],
  [1640671200000, "433479.76469284811025349950948620751"],
  [1640671800000, "434290.79651381910244986246954113097"],
  [1640672400000, "434634.66049770719889245790266562987"],
  [1640673000000, "434675.88536553823562342065081137587"],
  [1640673600000, "435463.00174620996699332605369538907"],
  [1640674200000, "435644.45409785310932373548861088678"],
  [1640674800000, "435662.24855668616188012807072979838"],
  [1640675400000, "436353.5689192783449449121258148347"],
  [1640676000000, "437113.48309001557347053516821214925"],
  [1640676600000, "438116.69773216982662501638088038567"],
  [1640677200000, "437923.60734824223968951570307215287"],
  [1640677800000, "438086.89495908096625794057828375647"],
  [1640678400000, "437514.65914265942091754162793096136"],
  [1640679000000, "437484.13443343819452283616157290356"],
  [1640679600000, "437499.21795057923638765529036838731"],
  [1640680200000, "437448.58067146643852100161520980491"],
  [1640680800000, "437292.85067660249568712569662052948"],
  [1640681400000, "437229.26449555294206234227453721988"],
  [1640682000000, "436629.60505625103029305819874587366"],
  [1640682600000, "435583.57518347110187652686030107562"],
  [1640683200000, "434756.94161135723312766831461876862"],
  [1640683800000, "434584.06038434721917548799397437052"],
  [1640684400000, "434755.7550351359120383522352998456"],
  [1640685000000, "435301.32638746476689786170918352316"],
  [1640685600000, "435698.42403405211301868307129716278"],
  [1640686200000, "436691.47281164599905704566645487228"],
  [1640686800000, "438081.46864519062080775859706957946"],
  [1640687400000, "438081.46864519062080775859706957946"],
  [1640688000000, "438505.12206518755224364138728022811"]
];
