import 'package:flutter/material.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/provider_review_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_providers_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_screen.dart';

import '../custom_widget/space.dart';
import '../models/services_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class AllCategoriesScreen extends StatefulWidget {
  final List<dynamic> list;
  final bool fromProviderDetails;

  const AllCategoriesScreen({Key? key, required this.list, required this.fromProviderDetails}) : super(key: key);

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  String image = "";
  String title = "";
  Color _textColor = transparent;
  Color _iconColor = whiteColor;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              _textColor = _isSliverAppBarExpanded
                  ? appStore.isDarkModeOn
                      ? whiteColor
                      : blackColor
                  : transparent;
              _iconColor = _isSliverAppBarExpanded
                  ? appStore.isDarkModeOn
                      ? whiteColor
                      : blackColor
                  : whiteColor;
            },
          );
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (200);
  }

  String _setImage(int index) {
    String image;
    if (widget.list == serviceProviders) {
      image = widget.list[index].serviceImage;
    } else {
      image = widget.list[index].imagePath!;
    }
    return image;
  }

  String _setTitle(int index) {
    String title;
    if (widget.list == serviceProviders) {
      title = widget.list[index].serviceName;
    } else {
      title = widget.list[index].title!;
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: appStore.isDarkModeOn ? customAppbarColorDark : customAppbarColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: _iconColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(background: Image.asset(room, fit: BoxFit.cover)),
            centerTitle: true,
            title: Text(
              "All Categories",
              textAlign: TextAlign.center,
              style: TextStyle(color: _textColor, fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          SliverToBoxAdapter(child: Container(padding: EdgeInsets.only(top: 10))),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.list.length,
              (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.list == serviceProviders) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
                        );
                      } else {
                        if (widget.fromProviderDetails) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProviderReview(index: index)),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServiceScreen(index: index)),
                          );
                        }
                      }
                    },
                    child: Card(
                      color: transparent,
                      elevation: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(_setImage(index), width: 90, height: 90, fit: BoxFit.cover),
                          ),
                          Space(16),
                          Text(
                            _setTitle(index),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(padding: EdgeInsets.only(top: 10)),
          ),
        ],
      ),
    );
  }
}
