import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:prokit_flutter/main.dart';

class ZoomImageScreen extends StatefulWidget {
  final int index;
  final List<String>? galleryImages;

  ZoomImageScreen({required this.index, this.galleryImages});

  @override
  _ZoomImageScreenState createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {
  bool showAppBar = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(black);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : black);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Gallery", style: boldTextStyle(size: 18, color: white)),
          elevation: 0.0,
        ),
        body: PhotoViewGallery.builder(
          scrollPhysics: BouncingScrollPhysics(),
          enableRotation: false,
          backgroundDecoration: BoxDecoration(color: Colors.black),
          pageController: PageController(initialPage: widget.index),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: Image.asset(widget.galleryImages![index], errorBuilder: (context, error, stackTrace) => PlaceHolderWidget()).image,
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              errorBuilder: (context, error, stackTrace) => PlaceHolderWidget(),
              heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryImages![index]),
            );
          },
          itemCount: widget.galleryImages!.length,
          loadingBuilder: (context, event) => Loader(),
        ),
      ),
    );
  }
}
