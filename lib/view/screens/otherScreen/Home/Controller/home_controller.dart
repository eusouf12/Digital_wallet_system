
// //   // ============= add scanner =============
// //   var isDocPost = false.obs;
// //   Future<void> createDoc() async {
// //     try {
// //       Map<String, dynamic> body = {"ocrType": selectedType.value};
// //
// //       dynamic response = await ApiClient.postMultipartData(
// //         ApiUrl.postAllTypeDoc,
// //         {
// //           "data": jsonEncode(body),
// //         },
// //         multipartBody: [
// //           MultipartBody("file", selectedImage.value!),
// //         ],
// //       );
// //       isDocPost.value = false;
// //
// //       Map<String, dynamic> jsonResponse = response.body is String
// //           ? jsonDecode(response.body)
// //           : response.body as Map<String, dynamic>;
// //
// //       debugPrint("Response: ${jsonEncode(jsonResponse)}");
// //
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         showCustomSnackBar(
// //           jsonResponse['message']?.toString() ??
// //               "Document upload successfully!",
// //           isError: false,
// //         );
// //         Get.offAllNamed(AppRoutes.homeScreen);
// //       } else {
// //         showCustomSnackBar(
// //           jsonResponse['message']?.toString() ?? "Document upload failed",
// //           isError: true,
// //         );
// //       }
// //     } catch (e) {
// //       Get.snackbar("Error", "An error occurred: $e");
// //     } finally {
// //       isDocPost.value = false;
// //     }
// //   }
// //
// //   // ========== pic to row data =================
// //   Map<String, String> convertRawOcrToMap(List<String> rawLines) {
// //     Map<String, String> dataMap = {};
// //
// //     for (String line in rawLines) {
// //       if (line.contains(":")) {
// //         final parts = line.split(":");
// //
// //         if (parts.length >= 2) {
// //           String key = parts[0].replaceAll('"', '').trim();
// //           String value = parts.sublist(1).join(":").replaceAll('"', '').trim();
// //
// //           dataMap[key] = value;
// //         }
// //       }
// //     }
// //     return dataMap;
// //   }
// //
// //   // ====================extractOCR()=====================
// //   RxBool isOcrLoading = false.obs;
// //
// //   RxMap<String, String> parsedOcrMap = <String, String>{}.obs;
// //
// //   Future<void> extractOCR({required String imageUrl}) async {
// //     try {
// //       isOcrLoading.value = true;
// //
// //       final raw = await extractOCRData(imageUrl);
// //       ocrRawLines.assignAll(raw);
// //
// //       // Convert to Key→Value
// //       parsedOcrMap.value = convertRawOcrToMap(raw);
// //     } finally {
// //       isOcrLoading.value = false;
// //     }
// //   }
// //
// //   /// ================= PDF ACTIONS =================
// //
// //   /// 1. Share PDF (Called from Home Screen)
// //   /// 1. Share PDF (Updated to fix MissingPluginException)
// //   Future<void> shareOcrPdf({
// //     required String docId,
// //     required String imageUrl,
// //     required String title,
// //   }) async {
// //     try {
// //       showCustomLoader(); // Show loading
// //
// //       // 1. Extract text and Generate PDF
// //       final rawLines = await extractOCRData(imageUrl);
// //       final dataMap = convertRawOcrToMap(rawLines);
// //
// //       final pdfBytes = await PdfService.generateOcrPdf(
// //         imageUrl: imageUrl,
// //         title: title,
// //         dataMap: dataMap,
// //       );
// //
// //       // 2. Save PDF to Temporary Directory
// //       final tempDir = await getTemporaryDirectory();
// //       // Sanitize title to remove special characters for filename
// //       final safeTitle = title.replaceAll(RegExp(r'[^\w\s]+'), '');
// //       final file = File('${tempDir.path}/$safeTitle.pdf');
// //
// //       await file.writeAsBytes(pdfBytes);
// //
// //       Get.back(); // Hide loading
// //
// //       // 3. Share using share_plus (More reliable than Printing.sharePdf)
// //       await Share.shareXFiles(
// //         [XFile(file.path)],
// //         text: 'Here is the document: $title',
// //         subject: title,
// //       );
// //
// //     } catch (e) {
// //       Get.back(); // Ensure loader is closed on error
// //       print("Share Error: $e");
// //       showCustomSnackBar("Failed to share PDF: $e", isError: true);
// //     }
// //   }
// //
// //   /// 2. Print PDF (Called from Single View)
// //   Future<void> printOcrPdf() async {
// //     try {
// //       if (singleOcrData.value == null) return;
// //
// //       final pdfBytes = await PdfService.generateOcrPdf(
// //         imageUrl: singleOcrData.value!.textImageUrl,
// //         title: singleOcrData.value!.ocrType,
// //         dataMap: parsedOcrMap,
// //       );
// //
// //       await Printing.layoutPdf(
// //         onLayout: (PdfPageFormat format) async => pdfBytes,
// //         name: singleOcrData.value!.ocrType,
// //       );
// //     } catch (e) {
// //       showCustomSnackBar("Failed to print: $e", isError: true);
// //     }
// //   }
// //
// //   /// 3. Download/Save PDF (Called from Single View)
// //   Future<void> downloadOcrPdf() async {
// //     try {
// //       if (singleOcrData.value == null) return;
// //
// //       final pdfBytes = await PdfService.generateOcrPdf(
// //         imageUrl: singleOcrData.value!.textImageUrl,
// //         title: singleOcrData.value!.ocrType,
// //         dataMap: parsedOcrMap,
// //       );
// //
// //       // Save to application documents directory
// //       final output = await getApplicationDocumentsDirectory();
// //       final String fileName =
// //           "${singleOcrData.value!.ocrType.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}.pdf";
// //       final file = File("${output.path}/$fileName");
// //       await file.writeAsBytes(pdfBytes);
// //
// //       showCustomSnackBar("Saved to: ${file.path}", isError: false);
// //
// //       // Open share sheet to allow saving to Files/Drive
// //       await Printing.sharePdf(
// //           bytes: pdfBytes, filename: fileName);
// //     } catch (e) {
// //       showCustomSnackBar("Failed to download: $e", isError: true);
// //     }
// //   }
// //
// //   /// Helper for loading dialog
// //   void showCustomLoader() {
// //     Get.dialog(
// //       const Center(child: CustomLoader(color: AppColors.primary)),
// //       barrierDismissible: false,
// //     );
// //   }
// // }
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:printing/printing.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:pdf/pdf.dart';
//
// import '../../../../../core/app_routes/app_routes.dart';
// import '../../../../../service/api_client.dart';
// import '../../../../../service/api_url.dart';
// import '../../../../../service/pdf_service.dart'; // Import your PdfService
// import '../../../../../utils/ToastMsg/toast_message.dart';
// import '../../../../../utils/app_colors/app_colors.dart';
// import '../../../../../utils/app_const/app_const.dart';
// import '../../../../components/custom_loader/custom_loader.dart';
// import '../Model/recent_model.dart';
// import '../Model/single_document_model.dart';
// import '../SingleView/img_to_text.dart';
//
// class HomeController extends GetxController {
//   // ====== Type & Status Variables ========
//   RxString selectedType = ''.obs;
//   void setType(String type) {
//     selectedType.value = type;
//   }
//
//   final rxOcrStatus = Status.loading.obs;
//   void setOcrStatus(Status status) => rxOcrStatus.value = status;
//
//   RxList<OcrItem> ocrList = <OcrItem>[].obs;
//   var isLoading = true.obs;
//
//   // ============= Fetch Recent Documents =============
//   Future<void> fetchOcrListRecent() async {
//     try {
//       final response = await ApiClient.getData(ApiUrl.recentDocument);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Map<String, dynamic> jsonResponse =
//         response.body is String ? jsonDecode(response.body) : response.body;
//         final OcrResponse model = OcrResponse.fromJson(jsonResponse);
//         ocrList.assignAll(model.data.allOcr);
//         setOcrStatus(Status.completed);
//       } else {
//         setOcrStatus(Status.error);
//         Get.snackbar("Error", "Failed to load OCR list");
//       }
//     } catch (e) {
//       setOcrStatus(Status.error);
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // ============= Fetch All Documents =============
//   final rxAllOcrStatus = Status.loading.obs;
//   void setAllOcrStatus(Status status) => rxAllOcrStatus.value = status;
//   RxList<OcrItem> ocrAllList = <OcrItem>[].obs;
//   var isAllLoading = true.obs;
//   var isMoreLoading = false.obs;
//   int currentPage = 1;
//   int totalPages = 1;
//
//   Future<void> getAllOcrListRecent() async {
//     if (currentPage > totalPages) return;
//     if (currentPage == 1) {
//       isAllLoading.value = true;
//       setAllOcrStatus(Status.loading);
//     } else {
//       isMoreLoading.value = true;
//     }
//
//     try {
//       final response = await ApiClient.getData(ApiUrl.allDocument(page: currentPage));
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Map<String, dynamic> jsonResponse =
//         response.body is String ? jsonDecode(response.body) : response.body;
//         final OcrResponse model = OcrResponse.fromJson(jsonResponse);
//         if (currentPage == 1) ocrAllList.clear();
//         ocrAllList.addAll(model.data.allOcr);
//         totalPages = model.data.meta.totalPage;
//         currentPage++;
//         setAllOcrStatus(Status.completed);
//       } else {
//         setAllOcrStatus(Status.error);
//       }
//     } catch (e) {
//       setAllOcrStatus(Status.error);
//     } finally {
//       isAllLoading.value = false;
//       isMoreLoading.value = false;
//     }
//   }
//
//   // ================== Single View Logic ==================
//   final rxSingleStatus = Status.loading.obs;
//   void setSingleStatus(Status status) => rxSingleStatus.value = status;
//   Rx<OcrSingleData?> singleOcrData = Rx<OcrSingleData?>(null);
//   var isSingleLoading = true.obs;
//
//   Future<void> getSingleOcrById({required String docId}) async {
//     try {
//       setSingleStatus(Status.loading);
//       isSingleLoading.value = true;
//       final response = await ApiClient.getData(ApiUrl.singleDocument(docId: docId));
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Map<String, dynamic> jsonResponse =
//         response.body is String ? jsonDecode(response.body) : response.body;
//         final OcrSingleDocumentModel model = OcrSingleDocumentModel.fromJson(jsonResponse);
//         singleOcrData.value = model.data;
//         setSingleStatus(Status.completed);
//
//         Get.toNamed(AppRoutes.singleView, arguments: {
//           "docId": docId,
//           "imageUrl": model.data.textImageUrl,
//         });
//       } else {
//         setSingleStatus(Status.error);
//         Get.snackbar("Error", "Failed to load document");
//       }
//     } catch (e) {
//       setSingleStatus(Status.error);
//     } finally {
//       isSingleLoading.value = false;
//     }
//   }
//
//   Future<void> deleteDocById({required String deleteId}) async {
//     try {
//       final response = await ApiClient.deleteData(ApiUrl.deleteOcrById(deleteId: deleteId));
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         await fetchOcrListRecent();
//         await getAllOcrListRecent();
//         showCustomSnackBar("Deleted successfully!", isError: false);
//       } else {
//         showCustomSnackBar("Failed to delete", isError: true);
//       }
//     } catch (e) {
//       showCustomSnackBar("Something went wrong!", isError: true);
//     }
//   }
//
//   // ========== Image Picker & Upload =========
//   final Rx<File?> selectedImage = Rx<File?>(null);
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> pickImageFromGallery() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) selectedImage.value = File(image.path);
//   }
//
//   Future<void> pickImageFromCamera() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: image.path,
//         uiSettings: [
//           AndroidUiSettings(toolbarTitle: 'Crop Image', lockAspectRatio: false),
//           IOSUiSettings(title: 'Crop Image'),
//         ],
//       );
//       if (croppedFile != null) selectedImage.value = File(croppedFile.path);
//     }
//   }
//
//   var isDocPost = false.obs;
//   Future<void> createDoc() async {
//     try {
//       isDocPost.value = true;
//       Map<String, dynamic> body = {"ocrType": selectedType.value};
//       dynamic response = await ApiClient.postMultipartData(
//         ApiUrl.postAllTypeDoc,
//         {"data": jsonEncode(body)},
//         multipartBody: [MultipartBody("file", selectedImage.value!)],
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         showCustomSnackBar("Document upload successfully!", isError: false);
//         Get.offAllNamed(AppRoutes.homeScreen);
//       } else {
//         showCustomSnackBar("Document upload failed", isError: true);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "An error occurred: $e");
//     } finally {
//       isDocPost.value = false;
//     }
//   }
//
//   // ========== OCR Helpers =================
//   RxList<String> ocrRawLines = <String>[].obs;
//   RxMap<String, String> parsedOcrMap = <String, String>{}.obs;
//   RxBool isOcrLoading = false.obs;
//
//   Map<String, String> convertRawOcrToMap(List<String> rawLines) {
//     Map<String, String> dataMap = {};
//     for (String line in rawLines) {
//       if (line.contains(":")) {
//         final parts = line.split(":");
//         if (parts.length >= 2) {
//           String key = parts[0].replaceAll('"', '').trim();
//           String value = parts.sublist(1).join(":").replaceAll('"', '').trim();
//           if(key.isNotEmpty && value.isNotEmpty) {
//             dataMap[key] = value;
//           }
//         }
//       }
//     }
//     return dataMap;
//   }
//
//   Future<void> extractOCR({required String imageUrl}) async {
//     try {
//       isOcrLoading.value = true;
//       final raw = await extractOCRData(imageUrl);
//       ocrRawLines.assignAll(raw);
//       parsedOcrMap.value = convertRawOcrToMap(raw);
//     } finally {
//       isOcrLoading.value = false;
//     }
//   }
//
//   // ================= PDF ACTIONS (UPDATED) =================
//
//   /// 1. Share PDF from Home Screen (Uses share_plus)
//   Future<void> shareOcrPdf({
//     required String docId,
//     required String imageUrl,
//     required String title,
//   }) async {
//     try {
//       showCustomLoader();
//
//       // Get Data & Image
//       final rawLines = await extractOCRData(imageUrl);
//       final dataMap = convertRawOcrToMap(rawLines);
//
//       // Generate PDF
//       final pdfBytes = await PdfService.generateOcrPdf(
//         imageUrl: imageUrl,
//         title: title,
//         dataMap: dataMap,
//       );
//
//       // Save to Temp
//       final tempDir = await getTemporaryDirectory();
//       final safeTitle = title.replaceAll(RegExp(r'[^\w\s]+'), '');
//       final file = File('${tempDir.path}/$safeTitle.pdf');
//       await file.writeAsBytes(pdfBytes);
//
//       Get.back(); // Hide loader
//
//       // Share
//       await Share.shareXFiles(
//         [XFile(file.path)],
//         text: 'Shared Document: $title',
//       );
//
//     } catch (e) {
//       Get.back();
//       print("Share Error: $e");
//       showCustomSnackBar("Failed to generate PDF.", isError: true);
//     }
//   }
//
//   /// 2. Print PDF (Uses printing package)
//   Future<void> printOcrPdf() async {
//     try {
//       if (singleOcrData.value == null) return;
//
//       final pdfBytes = await PdfService.generateOcrPdf(
//         imageUrl: singleOcrData.value!.textImageUrl,
//         title: singleOcrData.value!.ocrType,
//         dataMap: parsedOcrMap,
//       );
//
//       await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => pdfBytes,
//         name: singleOcrData.value!.ocrType,
//       );
//     } catch (e) {
//       showCustomSnackBar("Failed to print: $e", isError: true);
//     }
//   }
//
//   /// 3. Download PDF (Uses share_plus to save)
//   Future<void> downloadOcrPdf() async {
//     try {
//       if (singleOcrData.value == null) return;
//       showCustomLoader();
//
//       final pdfBytes = await PdfService.generateOcrPdf(
//         imageUrl: singleOcrData.value!.textImageUrl,
//         title: singleOcrData.value!.ocrType,
//         dataMap: parsedOcrMap,
//       );
//
//       final output = await getApplicationDocumentsDirectory();
//       final fileName = "${singleOcrData.value!.ocrType.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}.pdf";
//       final file = File("${output.path}/$fileName");
//       await file.writeAsBytes(pdfBytes);
//
//       Get.back();
//       showCustomSnackBar("PDF Generated. Choose where to save.", isError: false);
//
//       await Share.shareXFiles([XFile(file.path)], text: "Save PDF");
//
//     } catch (e) {
//       Get.back();
//       showCustomSnackBar("Failed to download: $e", isError: true);
//     }
//   }
//
//   void showCustomLoader() {
//     Get.dialog(
//       const Center(child: CustomLoader(color: AppColors.primary)),
//       barrierDismissible: false,
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../service/api_client.dart';
import '../../../../../service/api_url.dart';
import '../../../../../service/pdf_service.dart';
import '../../../../../utils/ToastMsg/toast_message.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../components/custom_loader/custom_loader.dart';
import '../Model/recent_model.dart';
import '../Model/single_document_model.dart';
import '../SingleView/img_to_text.dart';

class HomeController extends GetxController {
  // ====== type all category  ========
  RxString selectedType = ''.obs;
  void setType(String type) {
    selectedType.value = type;
    debugPrint("selectedType: $selectedType");
  }

  final rxOcrStatus = Status.loading.obs;
  void setOcrStatus(Status status) => rxOcrStatus.value = status;
  RxList<OcrItem> ocrList = <OcrItem>[].obs;
  var isLoading = true.obs;

  // ============= API Calls (Recent Documents) =============
  Future<void> fetchOcrListRecent() async {
    try {
      final response = await ApiClient.getData(ApiUrl.recentDocument);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse =
        response.body is String ? jsonDecode(response.body) : response.body;

        final OcrResponse model = OcrResponse.fromJson(jsonResponse);
        ocrList.assignAll(model.data.allOcr);
        setOcrStatus(Status.completed);
      } else {
        setOcrStatus(Status.error);
        Get.snackbar("Error", "Failed to load OCR list");
      }
    } catch (e) {
      setOcrStatus(Status.error);
    } finally {
      isLoading.value = false;
    }
  }

  // ============= API Calls (All Documents) =============
  final rxAllOcrStatus = Status.loading.obs;
  void setAllOcrStatus(Status status) => rxAllOcrStatus.value = status;
  RxList<OcrItem> ocrAllList = <OcrItem>[].obs;
  var isAllLoading = true.obs;
  var isMoreLoading = false.obs;
  int currentPage = 1;
  int totalPages = 1;

  Future<void> getAllOcrListRecent() async {
    if (currentPage > totalPages) return;
    if (currentPage == 1) {
      isAllLoading.value = true;
      setAllOcrStatus(Status.loading);
    } else {
      isMoreLoading.value = true;
    }

    try {
      final response = await ApiClient.getData(ApiUrl.allDocument(page: currentPage));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse =
        response.body is String ? jsonDecode(response.body) : response.body;

        final OcrResponse model = OcrResponse.fromJson(jsonResponse);
        if (currentPage == 1) ocrAllList.clear();
        ocrAllList.addAll(model.data.allOcr);
        totalPages = model.data.meta.totalPage;
        currentPage++;
        setAllOcrStatus(Status.completed);
      } else {
        setAllOcrStatus(Status.error);
      }
    } catch (e) {
      setAllOcrStatus(Status.error);
    } finally {
      isAllLoading.value = false;
      isMoreLoading.value = false;
    }
  }

  // ================== Single View Logic ==================
  final rxSingleStatus = Status.loading.obs;
  void setSingleStatus(Status status) => rxSingleStatus.value = status;
  Rx<OcrSingleData?> singleOcrData = Rx<OcrSingleData?>(null);
  var isSingleLoading = true.obs;

  Future<void> getSingleOcrById({required String docId}) async {
    try {
      setSingleStatus(Status.loading);
      isSingleLoading.value = true;
      final response = await ApiClient.getData(ApiUrl.singleDocument(docId: docId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse =
        response.body is String ? jsonDecode(response.body) : response.body;

        final OcrSingleDocumentModel model = OcrSingleDocumentModel.fromJson(jsonResponse);
        singleOcrData.value = model.data;
        setSingleStatus(Status.completed);

        Get.toNamed(AppRoutes.singleView, arguments: {
          "docId": docId,
          "imageUrl": model.data.textImageUrl, // For extraction
        });
      } else {
        setSingleStatus(Status.error);
        Get.snackbar("Error", "Failed to load document");
      }
    } catch (e) {
      setSingleStatus(Status.error);
    } finally {
      isSingleLoading.value = false;
    }
  }

  Future<void> deleteDocById({required String deleteId}) async {
    try {
      final response = await ApiClient.deleteData(ApiUrl.deleteOcrById(deleteId: deleteId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        await fetchOcrListRecent();
        await getAllOcrListRecent();
        showCustomSnackBar("Deleted successfully!", isError: false);
      } else {
        showCustomSnackBar("Failed to delete", isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong!", isError: true);
    }
  }

  // ========== Image Picker & Upload =========
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) selectedImage.value = File(image.path);
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(toolbarTitle: 'Crop Image', lockAspectRatio: false),
          IOSUiSettings(title: 'Crop Image'),
        ],
      );
      if (croppedFile != null) selectedImage.value = File(croppedFile.path);
    }
  }

  var isDocPost = false.obs;
  Future<void> createDoc() async {
    try {
      isDocPost.value = true;
      Map<String, dynamic> body = {"ocrType": selectedType.value};
      dynamic response = await ApiClient.postMultipartData(ApiUrl.postAllTypeDoc, {"data": jsonEncode(body)},
        multipartBody: [MultipartBody("file", selectedImage.value!)],
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar("Document upload successfully!", isError: false);
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        showCustomSnackBar("Document upload failed", isError: true);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isDocPost.value = false;
    }
  }

  // ========== OCR Helpers =================
  RxList<String> ocrRawLines = <String>[].obs;
  RxMap<String, String> parsedOcrMap = <String, String>{}.obs;
  RxBool isOcrLoading = false.obs;

  Map<String, String> convertRawOcrToMap(List<String> rawLines) {
    Map<String, String> dataMap = {};
    for (String line in rawLines) {
      if (line.contains(":")) {
        final parts = line.split(":");
        if (parts.length >= 2) {
          String key = parts[0].replaceAll('"', '').trim();
          String value = parts.sublist(1).join(":").replaceAll('"', '').trim();
          if(key.isNotEmpty && value.isNotEmpty) {
            dataMap[key] = value;
          }
        }
      }
    }
    return dataMap;
  }

  Future<void> extractOCR({required String imageUrl}) async {
    try {
      isOcrLoading.value = true;
      final raw = await extractOCRData(imageUrl);
      ocrRawLines.assignAll(raw);
      parsedOcrMap.value = convertRawOcrToMap(raw);
    } finally {
      isOcrLoading.value = false;
    }
  }

  // ================= PDF ACTIONS (UPDATED) =================
  Future<void> shareOcrPdf({
    required String displayImageUrl,
    required String extractionImageUrl,
    required String title,
  }) async {
    try {
      showCustomLoader();

      // A. Extract Text Data (using extractionImageUrl)
      final rawLines = await extractOCRData(extractionImageUrl);
      final dataMap = convertRawOcrToMap(rawLines);

      // B. Generate PDF (using displayImageUrl for visual)
      final pdfBytes = await PdfService.generateOcrPdf(
        displayImageUrl: displayImageUrl,
        title: title,
        dataMap: dataMap,
      );

      // C. Save to Temporary File
      final tempDir = await getTemporaryDirectory();
      final safeTitle = title.replaceAll(RegExp(r'[^\w\s]+'), '');
      final file = File('${tempDir.path}/$safeTitle.pdf');
      await file.writeAsBytes(pdfBytes);

      Get.back(); // Hide loader

      // D. Share using share_plus (Fixes MissingPluginException)
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Shared Document: $title',
      );

    } catch (e) {
      Get.back();
      print("Share Error: $e");
      showCustomSnackBar("Failed to generate PDF.", isError: true);
    }
  }
  void showCustomLoader() {
    Get.dialog(
      const Center(child: CustomLoader(color: AppColors.primary)),
      barrierDismissible: false,
    );
  }
}