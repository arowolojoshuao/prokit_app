class Customer {
  String email;
  String phoneNumber;
  String name;

  Customer({required this.name, required this.phoneNumber, required this.email});

  /// Converts instance of Customer to json
  Map<String, dynamic> toJson() {
    return {"email": this.email, "phonenumber": this.phoneNumber, "name": this.name};
  }
}
