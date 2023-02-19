import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPConstants.dart';

class OSDataModel {
  String? image;
  String? profileImage;
  String? title;
  String? subtitle;
  String? details;
  String? categoryIcon;
  Color? color;
  double? price;
  int? srno;
  int? like;
  bool isSelected;

  OSDataModel({
    this.image,
    this.profileImage,
    this.title,
    this.subtitle,
    this.details,
    this.categoryIcon,
    this.color,
    this.price,
    this.srno,
    this.like,
    this.isSelected = false,
  });
}

//NFT Market Place home page list1 getCategories
List<OSDataModel> getCategories() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Art', image: image1, categoryIcon: '$osImageBaseUrl/icons/os_ic_art.png'));
  list.add(OSDataModel(title: 'Music', image: image2, categoryIcon: '$osImageBaseUrl/icons/os_ic_music.png'));
  list.add(OSDataModel(title: 'Domain Names', image: image3, categoryIcon: '$osImageBaseUrl/icons/os_ic_domainname.png'));
  list.add(OSDataModel(title: 'Virtual Worlds', image: image4, categoryIcon: '$osImageBaseUrl/icons/os_ic_virtualworld.png'));
  list.add(OSDataModel(title: 'Trading Card', image: image5, categoryIcon: '$osImageBaseUrl/icons/os_ic_tradingcard.png'));
  list.add(OSDataModel(title: 'Collectibles', image: image7, categoryIcon: '$osImageBaseUrl/icons/os_ic_collectibles.png'));
  list.add(OSDataModel(title: 'Sports', image: image8, categoryIcon: '$osImageBaseUrl/icons/os_ic_sports.png'));
  list.add(OSDataModel(title: 'Utility', image: image9, categoryIcon: '$osImageBaseUrl/icons/os_ic_utility.png'));

  return list;
}

//NFT Market Place home page list2 getOpenSeaDrops
List<OSDataModel> getOpenSeaDrops() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Metaship by MetaMetaverse Mint', image: image5));
  list.add(OSDataModel(title: 'Kinesis Art', image: image6));
  list.add(OSDataModel(title: 'Doodles', image: image7));

  return list;
}

//NFT Market Place home page list3 getTrendingCollection
List<OSDataModel> getTrendingCollection() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'PhantomNetwork', image: image2, profileImage: image3));
  list.add(OSDataModel(title: 'Lavish Lions', subtitle: '', image: image9, profileImage: image6));
  list.add(OSDataModel(title: 'The lil rens', subtitle: 'lil-deployer', image: image7, profileImage: image2));
  list.add(OSDataModel(title: 'Communi3', subtitle: '', image: image10, profileImage: image1));
  list.add(OSDataModel(title: 'Silks Grnesis Avatars', subtitle: 'gameofsilks', image: image4, profileImage: image5));
  list.add(OSDataModel(title: 'Dr. Grordborts: Rayguns', subtitle: 'FLUFxWETA', image: image5, profileImage: image6));
  list.add(OSDataModel(title: 'Cets on Creck', subtitle: 'Cets on Creck', image: image6, profileImage: image7));
  list.add(OSDataModel(title: 'Famous Fox Federation', subtitle: 'Famous Fox Federation', image: image3, profileImage: image5));

  return list;
}

//NFT Market Place home page list14 getRecentRocketsDetails
List<OSDataModel> getRecentRocketsDetails() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Chromie Squiggle by Snowfro', subtitle: "521.22%", image: image10));
  list.add(OSDataModel(title: 'BEANZ Official', subtitle: "320.45%", image: image9));
  list.add(OSDataModel(title: 'Something Token', subtitle: "210.23%", image: image8));
  list.add(OSDataModel(title: 'Art Blocks Curated', subtitle: "123.52%", image: image7));
  list.add(OSDataModel(title: 'Azuki', subtitle: "241.02%", image: image6));
  list.add(OSDataModel(title: 'DeGods', subtitle: "145.36%", image: image5));

  return list;
}

//NFT Market Place home page list5 getHotItems
List<OSDataModel> getHotItems() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Rarible', subtitle: 'Bored Ape Yacht Club #520 [Legendary Edition]', price: 0.1, like: 0, image: image9, isSelected: false));
  list.add(OSDataModel(title: 'Rarible', subtitle: 'Bored Ape Yacht Club #840 [Legendary Edition] ', price: 0.2, like: 0, image: image3, isSelected: false));
  list.add(OSDataModel(title: 'Rarible', subtitle: 'MSO LAB Genesis #1285', price: 3.6, like: 0, image: image7, isSelected: false));
  list.add(OSDataModel(title: 'Rarible', subtitle: 'MSO LAB Genesis #756', price: 6.2, like: 0, image: image8, isSelected: false));

  return list;
}

//NFT Market Place home page list6 getExpiringSoon
List<OSDataModel> getExpiringSoon() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Impossible Blocks', subtitle: 'Impossible Blocks #654', price: 0.958, like: 0, image: image8, isSelected: false));
  list.add(OSDataModel(title: 'KnownOrigin', subtitle: 'Bavaria: For All The Dreamers', price: 4.7, like: 0, image: image10, isSelected: false));
  list.add(OSDataModel(title: 'Yat', subtitle: 'Movies', price: 0.456, like: 0, image: image9, isSelected: false));
  list.add(OSDataModel(title: 'L.O Community', subtitle: 'Lofi Originals #741', price: 0.456, like: 0, image: image7, isSelected: false));
  list.add(OSDataModel(title: 'Impossible Blocks', subtitle: 'Impossible Blocks #456', price: 0.752, like: 0, image: image3, isSelected: false));
  list.add(OSDataModel(title: "'MOAR' by Joan Cornella", subtitle: 'MOAR #3695', price: 2.52, like: 0, image: image2, isSelected: false));

  return list;
}

//NFT Market Place home page list7 getNewTopSellers
List<OSDataModel> getNewTopSellers() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'The Winterton Token', subtitle: 'Winterton Token [Legendary Edition]', price: 0.1, like: 0, image: image3, isSelected: false));
  list.add(OSDataModel(title: 'Dooplicator', subtitle: 'Dooplicator #143', price: 0.2, like: 0, image: image9, isSelected: false));
  list.add(OSDataModel(title: 'Danny Kass Art', subtitle: 'Trippy Do Know Glitch [Legendary Edition]', price: 3.6, like: 0, image: image6, isSelected: false));
  list.add(OSDataModel(title: 'CryptoPunks', subtitle: 'CryptoPunks #412', price: 6.2, like: 0, image: image1, isSelected: false));
  list.add(OSDataModel(title: 'Gutter Clones', subtitle: 'Gutter Clones #11425', price: 5.2, like: 0, image: image2, isSelected: false));

  return list;
}

//NFT Market Place home page OnTap CategoriesDetails
List<OSDataModel> getTapCategoriesDetails() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #6546', price: 0.189, like: 0, image: '$osImageBaseUrl/os_gifs/kitten_fighting.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #2469', price: 0.1682, like: 0, image: '$osImageBaseUrl/os_gifs/cat-cats.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #830', price: 0.289, like: 0, image: '$osImageBaseUrl/os_gifs/cute-cat.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #3657', price: 0.179, like: 0, image: '$osImageBaseUrl/os_gifs/gifcat.gif', isSelected: false));

  return list;
}

//NFT Market Place home page OnTap NotableDropsDetails NFT Market Place home
List<OSDataModel> getTapNotableDropsDetails() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Metaship by MetaMetaverse Mint', subtitle: 'Mint Three (3) Metaship NFTs', price: 0.3, like: 0, image: '$osImageBaseUrl/os_gifs/gif1.gif', isSelected: false));
  list.add(OSDataModel(title: 'Metaship by MetaMetaverse Mint', subtitle: 'Mint Three (5) Metaship NFTs', price: 0.5, like: 0, image: '$osImageBaseUrl/os_gifs/gif2.gif', isSelected: false));
  list.add(OSDataModel(title: 'Metaship by MetaMetaverse Mint', subtitle: 'Mint Three (10) Metaship NFTs', price: 1.5, like: 0, image: '$osImageBaseUrl/os_gifs/gif3.gif', isSelected: false));
  list.add(OSDataModel(title: 'Metaship by MetaMetaverse Mint', subtitle: 'Mint Three (25) Metaship NFTs', price: 3.5, like: 0, image: '$osImageBaseUrl/os_gifs/gif4.gif', isSelected: false));

  return list;
}

//NFT Market Place home page OnTap TrendingCollection
List<OSDataModel> getTapTrendingCollection() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #6546', price: 0.189, like: 0, image: '$osImageBaseUrl/os_gifs/kitten_fighting.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #2469', price: 0.1682, like: 0, image: '$osImageBaseUrl/os_gifs/cat-cats.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #830', price: 0.289, like: 0, image: '$osImageBaseUrl/os_gifs/cute-cat.gif', isSelected: false));
  list.add(OSDataModel(title: 'OneOneNFT', subtitle: 'OneOnes #3657', price: 0.179, like: 0, image: '$osImageBaseUrl/os_gifs/gifcat.gif', isSelected: false));

  return list;
}

//NFT Market Place home page list8 getExpiringSoon and getNewTopSellers tap details
List<OSDataModel> getMoreFromCollection() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Chumbi Valley Founders Collection', subtitle: 'Mythic Pod Remnants', price: 3.4, like: 0, image: image1, isSelected: false));
  list.add(OSDataModel(title: 'Chumbi Valley Founders Collection', subtitle: 'Nimble Boots', price: 5.7, like: 0, image: image2, isSelected: false));
  list.add(OSDataModel(title: 'Chumbi Valley Founders Collection', subtitle: 'Blue Topaz Pillar', price: 4.9, like: 0, image: image3, isSelected: false));
  list.add(OSDataModel(title: 'Chumbi Valley Founders Collection', subtitle: 'Mystery Crate', price: 2.1, like: 0, image: image4, isSelected: false));
  list.add(OSDataModel(title: 'Chumbi Valley Founders Collection', subtitle: 'Golden Name Tag', price: 1.6, like: 0, image: image5, isSelected: false));

  return list;
}

//NFT Market Place home page OnTap getDetailsExpandable (Expandable About Collection, Properties, Details, Price history)
List<OSDataModel> getDetailsExpandable() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(
      title: 'About Collection',
      subtitle: 'Sabet',
      isSelected: false,
      categoryIcon: '$osImageBaseUrl/icons/oc_ic_about_collection.png',
      details:
          'Practising is vital when trying to improve logic building skills. Solving problems every day and rigorously challenging oneself is a great way to become capable of building superior logic.Programmers must practise working with different algorithms extensively and thus make way for a deeper understanding of program logic.Building logic over and over again allows developers to build logic more effectively over time. Programmers must keep on vigorously coding or writing solutions to problems and hone their application of logic on a daily basis.'));
  list.add(OSDataModel(
      title: 'Properties',
      subtitle: 'Art Work',
      isSelected: false,
      categoryIcon: '$osImageBaseUrl/icons/os_ic_properties.png',
      details:
          'Checking for solutions is probably the most important method of learning how to handle programming challenges. Especially when it comes to logic, solutions provided in communities and by other programmers help explain how the logic is built and why.The “why” is very important here as building superior logic is not possible without a clear understanding of how a program’s logic functions and affects the programming.'));
  list.add(OSDataModel(
      title: 'Details',
      subtitle: 'Contract',
      isSelected: false,
      categoryIcon: '$osImageBaseUrl/icons/os_ic_details.png',
      details:
          'It is a great idea to pen down solutions, models and strategies. Humans tend to remember things they write down much more efficiently. Also, jotting down strategies and solutions is a great way to understand how they function and can be implemented.Using computers to program logic is great, but working on logic using pen and paper allows much more advanced insight. Breaking down solutions and thinking about them is much easier when programmers write them down.'));
  list.add(OSDataModel(
      title: 'Price history',
      subtitle: 'All Price',
      isSelected: false,
      categoryIcon: '$osImageBaseUrl/icons/os_ic_price.png',
      details:
          'Programmers must never get stuck on one topic or keep repeating themselves over and over again. It is great to ensure that one knows the topic thoroughly by solving multiple problems from a given topic. However, one must also know when to move on.Programmers must expand their knowledge and logic building skills by tackling new topics and challenges. Delving into unknown territory is highly suggested and one can always look up solutions from other places if he or she feels confused or stuck.One must always aim to try new problems, algorithms and the different variations of logic that can be applied to programs.'));

  return list;
}

//More Page Blog
List<OSDataModel> getBlog() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Learn', image: image1, subtitle: " How to Fund MetaMask with ETH", color: Colors.purple));
  list.add(OSDataModel(title: 'Announcement', image: image2, subtitle: "NFT Market Place Acquires Gem to Invest in 'Pro' Experience", color: Colors.blue));
  list.add(OSDataModel(title: 'Guest post', image: image7, subtitle: "Checkout Solana - now in beta on NFT Market Place", color: Colors.blue));
  list.add(OSDataModel(title: 'Guide', image: image4, subtitle: "Intro to Crypto Wallets", color: Colors.purple));
  list.add(OSDataModel(title: 'Learn', image: image5, subtitle: "How to Easily Setup a MetaMask Wallet", color: Colors.blue));

  return list;
}

//More Page HelpCente
List<OSDataModel> getHelpCenter() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Getting Started', subtitle: "Create an account,set up your wallet, and more", color: Colors.teal));
  list.add(OSDataModel(title: 'Buy', subtitle: "Purchase your forst NFT, understand gas fees and what's free", color: Colors.pink));
  list.add(OSDataModel(title: 'Sell', subtitle: "List your NFTs for sell with a set price, as an auction", color: Colors.purple));
  list.add(OSDataModel(title: 'Create', subtitle: "Create your first NFT and collection to start selling and sharing", color: Colors.lightBlueAccent));
  list.add(OSDataModel(title: 'FAQs', subtitle: "Learn answer to frequently asked questions on NFT Market Place", color: Colors.redAccent));
  list.add(OSDataModel(title: 'User Safety', subtitle: "Learn More about antifraud and user safely processes", color: Colors.green));
  list.add(OSDataModel(title: 'Partners', subtitle: "Learn hoe to partner with NFT Market Place to showcase yout drops", color: Colors.teal));
  list.add(OSDataModel(title: 'Developers', subtitle: "Learn more how to develop and build with NFT Market Place", color: Colors.orange));
  list.add(OSDataModel(title: 'Reporting', subtitle: "Get insights about your helpdesk performance, and identify the biggest clogs in your support process", color: Colors.pinkAccent));
  list.add(OSDataModel(title: 'Collaboration', subtitle: "Work together, with the right person to help you resolve your support tickets faster and more efficiently", color: Colors.purple));

  return list;
}

//More Page FollowUs
List<OSDataModel> getfollowUs() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Twitter', image: '$osImageBaseUrl/icons/os_ic_twitter.png', color: Colors.blueAccent));
  list.add(OSDataModel(title: 'Instagram', image: '$osImageBaseUrl/icons/os_ic_instagram.png', color: Colors.pink));
  list.add(OSDataModel(title: 'Discord', image: '$osImageBaseUrl/icons/os_ic_discord.png', color: Colors.purple));
  list.add(OSDataModel(title: 'Reddit', image: '$osImageBaseUrl/icons/os_ic_reddit.png', color: Colors.deepOrange));
  list.add(OSDataModel(title: 'Youtube', image: '$osImageBaseUrl/icons/os_ic_youtube.png', color: Colors.red));

  return list;
}

//Ranking Page getChains
List<OSDataModel> getChains() {
  List<OSDataModel> list = [];
  list.add(OSDataModel(title: 'All chains', categoryIcon: '$osImageBaseUrl/icons/os_ic_ethereum.png'));
  list.add(OSDataModel(title: 'Ethereum', categoryIcon: '$osImageBaseUrl/icons/os_ic_token.png'));
  list.add(OSDataModel(title: 'Polygon', categoryIcon: '$osImageBaseUrl/icons/os_ic_polygon.png'));
  list.add(OSDataModel(title: 'Klaytn', categoryIcon: '$osImageBaseUrl/icons/os_ic_klaytn.png'));
  list.add(OSDataModel(title: 'Solana', categoryIcon: '$osImageBaseUrl/icons/os_ic_solana.png'));

  return list;
}

//Ranking Page getSevenDayVolume
List<OSDataModel> getSevenDayVolume() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(title: 'Seven day volume', isSelected: false));
  list.add(OSDataModel(title: '24h volume', isSelected: false));
  list.add(OSDataModel(title: 'All-time volume', isSelected: false));
  list.add(OSDataModel(title: 'Seven day change', isSelected: false));
  list.add(OSDataModel(title: 'Number of owners', isSelected: false));
  list.add(OSDataModel(title: 'Total supply', isSelected: false));

  return list;
}

//Ranking Page getRanking
List<OSDataModel> getRanking() {
  List<OSDataModel> list = [];

  list.add(OSDataModel(srno: 1, categoryIcon: '$osImageBaseUrl/icons/os_ic_music.png', title: 'Otherdeed for Otherside', price: 142313.50));
  list.add(OSDataModel(srno: 2, categoryIcon: '$osImageBaseUrl/icons/os_ic_new.png', title: 'Mutant Ape Yacht Club', price: 29525.45));
  list.add(OSDataModel(srno: 3, categoryIcon: '$osImageBaseUrl/icons/os_ic_klaytn.png', title: 'Bored Ape Yacht Club', price: 580210.07));
  list.add(OSDataModel(srno: 4, categoryIcon: '$osImageBaseUrl/icons/os_ic_domainname.png', title: 'Okay Bears', price: 15263.00));
  list.add(OSDataModel(srno: 5, categoryIcon: '$osImageBaseUrl/icons/os_ic_link.png', title: 'Moonbirds', price: 152635.00));
  list.add(OSDataModel(srno: 6, categoryIcon: '$osImageBaseUrl/icons/os_ic_solana.png', title: 'Akutars', price: 365355.25));
  list.add(OSDataModel(srno: 7, categoryIcon: '$osImageBaseUrl/icons/os_ic_sports.png', title: 'Doodles', price: 523644.55));
  list.add(OSDataModel(srno: 8, categoryIcon: '$osImageBaseUrl/icons/os_ic_polygon.png', title: 'Azuki', price: 453653.55));

  return list;
}
