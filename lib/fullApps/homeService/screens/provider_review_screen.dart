import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../custom_widget/space.dart';
import '../models/renovate_services_model.dart';
import '../utils/colors.dart';

class ProviderReview extends StatefulWidget {
  final int index;

  const ProviderReview({Key? key, required this.index}) : super(key: key);

  @override
  State<ProviderReview> createState() => _ProviderReviewState();
}

class _ProviderReviewState extends State<ProviderReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: customAppbarColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: context.iconColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(renovateServices[widget.index].imagePath!, fit: BoxFit.cover),
            ),
            centerTitle: true,
            title: Text(
              renovateServices[widget.index].title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(painter1, fit: BoxFit.cover),
                        ),
                      ),
                      Space(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("John Smith", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          Space(4),
                          SmoothStarRating(
                            allowHalfRating: false,
                            starCount: 5,
                            rating: 4.5,
                            size: 20.0,
                            color: yellowColor,
                            borderColor: yellowColor,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            spacing: .5,
                          )
                        ],
                      ),
                    ],
                  ),
                  Space(16),
                  Text("Date And Time", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                  Space(8),
                  Text(
                    "26 jan 2022 at 4am",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: subTitle, fontSize: 14),
                  ),
                  Space(16),
                  Text("Detail Review", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                  Space(8),
                  Text(
                    "When it comes to making decisions, we humans aren’t always independent thinkers. From buying our morning coffee to big-ticket items like a new car, we depend on our network’s opinions, advice, or perspectives for making the right decision. With the internet, those networks get way, way bigger. We’re no longer confined to just friends, family, and coworkers—we can see what people all around the world think with just a quick Google search. And these customer reviews hold serious weight with shoppers. Online reviews—either positive or negative—can impact over 93% of consumers’ decisions.1 While reviews can accumulate on their own, they shouldn’t exist in a vacuum. Knowing how to ask for reviews, leverage them to get more business, and respond to less-than-favorable customer testimonials can improve your business image and land you more long-lasting customers. ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: subTitle, fontSize: 14),
                  ),
                  // Padding(padding: EdgeInsets.all(10), child: SizedBox(height: MediaQuery.of(context).size.height * 0.07))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
