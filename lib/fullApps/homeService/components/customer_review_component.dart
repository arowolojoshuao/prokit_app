import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/fullApps/homeService/models/customer_review_model.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CustomerReviewComponent extends StatelessWidget {
  final CustomerReviewModel? customerReviewModel;

  CustomerReviewComponent({this.customerReviewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: AssetImage(customerReviewModel!.customerImage),
                  ),
                  Space(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customerReviewModel!.customerName, style: TextStyle(fontWeight: FontWeight.bold)),
                      Space(4),
                      SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        rating: customerReviewModel!.rating,
                        size: 16.0,
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
              Space(8),
              Text(
                customerReviewModel!.detailReview,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
