class StandardResponse {
  String? status;
  String? message;
  StandardResponseData? data;

  StandardResponse({this.status, this.data, this.message});

  StandardResponse.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.message = json["message"];
    this.data = StandardResponseData.fromJson(json["data"]);
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    return {"status": this.status, "message": this.message, "data": this.data?.toJson()};
  }
}

class StandardResponseData {
  String? link;

  StandardResponseData([this.link = ""]);

  StandardResponseData.fromJson(Map<String, dynamic> json) {
    this.link = json["link"];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    return {"link": this.link};
  }
}
