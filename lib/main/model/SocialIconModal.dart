import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SocialIconModal {
  String? icon;

  String? iconTitle;
  String? iconUrl;
  Color? iconColor;

  SocialIconModal({this.icon, this.iconTitle, this.iconUrl, this.iconColor});
}

List<SocialIconModal> getSocialIconData() {
  List<SocialIconModal> list = [];
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_youtube.svg',
    iconTitle: 'Youtube',
    iconUrl: youTubeUrl,
  ));
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_facebook.svg',
    iconTitle: 'Facebook',
    iconUrl: facebookUrl,
  ));
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_twitter.svg',
    iconTitle: 'Twitter',
    iconUrl: twitterUrl,
  ));
  list.add(
    SocialIconModal(
      icon: 'images/app/socialIcons/ic_instagram.svg',
      iconTitle: 'Instagram',
      iconUrl: instaUrl,
    ),
  );
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_linkedin.svg',
    iconTitle: 'Linkedin',
    iconUrl: linkedInUrl,
  ));
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_pinterest.svg',
    iconTitle: 'Pinterest',
    iconUrl: pinterestUrl,
  ));
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_dribbble.svg',
    iconTitle: 'Dribbble',
    iconUrl: dribbleUrl,
  ));
  list.add(SocialIconModal(
    icon: 'images/app/socialIcons/ic_behance.svg',
    iconTitle: 'Behance',
    iconUrl: behanceUrl,
  ));
  return list;
}
