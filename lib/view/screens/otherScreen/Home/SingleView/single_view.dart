import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_loader/custom_loader.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../Controller/home_controller.dart';

class SingleView extends StatelessWidget {
  SingleView({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String docId = args["docId"];
    final String imageUrl = args["imageUrl"];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.getSingleOcrById(docId: docId);
      homeController.extractOCR(imageUrl: imageUrl);
    });
    // capitalize words
    String capitalizeWords(String text) {
      if (text.isEmpty) return text;
      return text
          .split(' ')
          .map((word) => word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1)
          : word)
          .join(' ');
    }

    return Obx(() {
      final singleData = homeController.singleOcrData.value;

      return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child: Scaffold(
          appBar: CustomRoyelAppbar(
            leftIcon: true,
            titleName: capitalizeWords("${singleData?.ocrType ?? 'Document'}"),
            color: AppColors.black,
          ),

          body: Obx(() {
            if (homeController.isOcrLoading.value) {
              return const Center(child: CustomLoader(color: AppColors.primary));
            }
            if (homeController.ocrRawLines.isEmpty) {
              return const Center(child: Text("No OCR Data Found"));
            }
            final map = homeController.parsedOcrMap;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: AppColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display Image
                            CustomNetworkImage(
                              imageUrl: "${singleData?.filePath}",
                              height: 200,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(height: 50),

                            // Display Data Pairs
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: map.entries.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 140,
                                          child: CustomText(
                                            text: "${capitalizeWords(e.key)} : ",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.black,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: capitalizeWords(e.value),
                                            textAlign: TextAlign.start,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black_02,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}