import 'package:intl/intl.dart';

class OcrResponse {
  final bool success;
  final String message;
  final OcrData data;

  OcrResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OcrResponse.fromJson(Map<String, dynamic> json) {
    return OcrResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OcrData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}
class OcrData {
  final Meta meta;
  final List<OcrItem> allOcr;

  OcrData({
    required this.meta,
    required this.allOcr,
  });

  factory OcrData.fromJson(Map<String, dynamic> json) {
    return OcrData(
      meta: Meta.fromJson(json['meta'] ?? {}),
      allOcr: (json['all_ocr'] as List<dynamic>? ?? [])
          .map((e) => OcrItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'all_ocr': allOcr.map((e) => e.toJson()).toList(),
    };
  }
}
class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPage': totalPage,
    };
  }
}
class OcrItem {
  final String id;
  final String userId;
  final String filePath;
  final String ocrType;
  final bool status;
  final String textImageUrl;
  final bool isDelete;
  final String createdAt;
  final String updatedAt;

  OcrItem({
    required this.id,
    required this.userId,
    required this.filePath,
    required this.ocrType,
    required this.status,
    required this.textImageUrl,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OcrItem.fromJson(Map<String, dynamic> json) {
    return OcrItem(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      filePath: json['filePath'] ?? '',
      ocrType: json['ocrType'] ?? '',
      status: json['status'] ?? false,
      textImageUrl: json['textImageUrl'] ?? '',
      isDelete: json['isDelete'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
  /// ========== FORMAT DATE ==========
  String get formattedUploadDate {
    try {
      final date = DateTime.parse(createdAt);
      return " ${DateFormat('MMM dd, yyyy').format(date)}";
    } catch (e) {
      return "Uploaded: -";
    }
  }

  String get formattedUpdatedDate {
    try {
      final date = DateTime.parse(updatedAt);
      return " ${DateFormat('MMM dd, yyyy').format(date)}";
    } catch (e) {
      return "Updated: -";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'filePath': filePath,
      'ocrType': ocrType,
      'status': status,
      'textImageUrl': textImageUrl,
      'isDelete': isDelete,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

