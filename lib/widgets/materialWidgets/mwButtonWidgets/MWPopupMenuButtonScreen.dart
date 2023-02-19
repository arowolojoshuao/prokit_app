import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWPopupMenuButtonScreen extends StatefulWidget {
  static String tag = '/MWPopupMenuButtonScreen';

  @override
  MWPopupMenuButtonScreenState createState() => MWPopupMenuButtonScreenState();
}

class MWPopupMenuButtonScreenState extends State<MWPopupMenuButtonScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Popup Menu Button"),
        body: Container(
          padding: EdgeInsets.all(12),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Default Popup menu',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toasty(context, value);
                      },
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Mark as read", style: primaryTextStyle()),
                            value: 'Mark as read',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Mute Notification", style: primaryTextStyle()),
                            value: ' Mute Notification',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Settings", style: primaryTextStyle()),
                            value: 'Settings',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Sectioned Popup menu',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toasty(context, value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Select Language", style: primaryTextStyle()),
                            value: 'Select Language',
                          ),
                        );
                        list.add(PopupMenuDivider(
                          height: 2,
                        ));
                        list.add(
                          PopupMenuItem(
                            child: Text("English", style: primaryTextStyle()),
                            value: 'English',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Spanish", style: primaryTextStyle()),
                            value: 'Spanish',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Arabic", style: primaryTextStyle()),
                            value: 'Arabic',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Hindi", style: primaryTextStyle()),
                            value: 'Hindi',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Gujarati", style: primaryTextStyle()),
                            value: 'Gujarati',
                          ),
                        );

                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Popup menu with Icons',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toasty(context, value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.file_upload,
                                color: appStore.iconColor,
                              ),
                              title: Text('Upload', style: primaryTextStyle()),
                            ),
                            value: 'Upload',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.bookmark,
                                color: appStore.iconColor,
                              ),
                              title: Text('Bookmark', style: primaryTextStyle()),
                            ),
                            value: 'Bookmark',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.share,
                                color: appStore.iconColor,
                              ),
                              title: Text('Share', style: primaryTextStyle()),
                            ),
                            value: 'Share',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
