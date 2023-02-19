import '../utils/images.dart';

List<CustomerReviewModel> customerReviews = getCustomerReviews();

class CustomerReviewModel {
  int id;
  String customerName;
  double rating;
  String detailReview;
  String customerImage;

  CustomerReviewModel(this.id, this.customerName, this.rating, this.detailReview, this.customerImage);
}

List<CustomerReviewModel> getCustomerReviews() {
  List<CustomerReviewModel> list = List.empty(growable: true);
  list.add(
    CustomerReviewModel(
      1,
      "John Smith",
      3,
      "Good for you and My experience was great, I use it daily and like the app very much.Good for you and My experience was great, I use it daily and like the app very much.Good for you and My experience was great, I use it daily and like the app very much.",
      contractor,
    ),
  );
  list.add(
    CustomerReviewModel(
      2,
      "Marry jaine",
      4,
      "Best App for services and I find it easy to solve all my house task with this app.I like the app very much",
      painter,
    ),
  );
  list.add(
    CustomerReviewModel(
      3,
      "Lain Caster",
      5,
      "Good for you and My experience was great, I use it daily and like the app very much.Good for you and My experience was great, I use it daily and like the app very much.Good for you and My experience was great, I use it daily and like the app very much.",
      painter1,
    ),
  );
  return list;
}
