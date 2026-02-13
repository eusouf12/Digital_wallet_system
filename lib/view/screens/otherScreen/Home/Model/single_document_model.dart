class OcrSingleDocumentModel {
  final bool success;
  final String message;
  final OcrSingleData data;

  OcrSingleDocumentModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OcrSingleDocumentModel.fromJson(Map<String, dynamic> json) {
    return OcrSingleDocumentModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OcrSingleData.fromJson(json['data'] ?? {}),
    );
  }
}

class OcrSingleData {
  final String id;
  final String userId;
  final String filePath;
  final String ocrType;
  final bool status;
  final String textImageUrl;
  final bool isDelete;
  final String createdAt;
  final String updatedAt;
  final int v;

  OcrSingleData({
    required this.id,
    required this.userId,
    required this.filePath,
    required this.ocrType,
    required this.status,
    required this.textImageUrl,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OcrSingleData.fromJson(Map<String, dynamic> json) {
    return OcrSingleData(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      filePath: json['filePath'] ?? '',
      ocrType: json['ocrType'] ?? '',
      status: json['status'] ?? false,
      textImageUrl: json['textImageUrl'] ?? '',
      isDelete: json['isDelete'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}
