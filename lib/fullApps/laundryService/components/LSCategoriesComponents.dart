import 'package:flutter/material.dart';

class LSCategoriesComponents extends StatefulWidget {
  static String tag = '/LSCategoriesComponents';

  @override
  LSCategoriesComponentsState createState() => LSCategoriesComponentsState();
}

class LSCategoriesComponentsState extends State<LSCategoriesComponents> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
