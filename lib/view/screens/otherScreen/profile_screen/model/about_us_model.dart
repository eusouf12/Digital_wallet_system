class AboutUsModel {
  bool success;
  String message;
  AboutUsData? data;

  AboutUsModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? AboutUsData.fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data?.toJson(),
    };
  }
}

class AboutUsData {
  String? id;
  String? aboutUs;
  int? v;

  AboutUsData({
     this.id,
     this.aboutUs,
     this.v,
  });

  factory AboutUsData.fromJson(Map<String, dynamic> json) {
    return AboutUsData(
      id: json["_id"] ?? "",
      aboutUs: json["aboutUs"] ?? "",
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "aboutUs": aboutUs,
      "__v": v,
    };
  }
}
