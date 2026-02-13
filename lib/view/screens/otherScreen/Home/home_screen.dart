import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_loader/custom_loader.dart';
import 'package:omerabashar_flutter_app/view/components/custom_nav_bar/navbar.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/Home/widget/custom_document.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
import 'Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchOcrListRecent();
      controller.getAllOcrListRecent();
    });

    return CustomGradient(
      color1: AppColors.white,
      color2: AppColors.white,
      child: Scaffold(
        backgroundColor: AppColors.white_2,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: CustomImage(
                        imageSrc: AppIcons.idCard,
                        height: 18.w,
                        width: 18.w,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "Digital ID",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CustomLoader(color: AppColors.black));
          }

          if (controller.rxOcrStatus.value == Status.error) {
            return const Center(child: Text("Failed to load documents"));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                // Recent Documents Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "Recent Documents",
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.recentDocument),
                        child: const CustomText(
                          text: "View All",
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Recent Documents List
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.31,
                  child: controller.ocrList.isEmpty
                      ? const Center(
                    child: CustomText(
                      text: "No Recent document found",
                      color: AppColors.black_02,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                      : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    itemCount: min(5, controller.ocrList.length),
                    itemBuilder: (context, index) {
                      final item = controller.ocrList[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: SizedBox(
                          width: 250,
                          child: CustomDocument(
                            img: "${item.filePath}",
                            title: item.ocrType,
                            description: item.ocrType,
                            uploadedDate: item.formattedUploadDate,
                            status: "New",
                            onTapView: () {
                              controller.getSingleOcrById(docId: item.id);
                            },
                            onTapShare: () {
                              // Calls the fixed controller method
                              controller.shareOcrPdf(
                                //docId: item.id,
                                displayImageUrl: item.filePath, // Note: Ensure this is the correct URL for the scanned image
                                extractionImageUrl: item.textImageUrl,
                                title: item.ocrType,
                              );
                            },
                            onTapDelete: () {
                              controller.deleteDocById(deleteId: item.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // All Documents Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "All Documents",
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.allDocument),
                        child: const CustomText(
                          text: "View All",
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // All Documents List
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3099,
                  child: controller.ocrAllList.isEmpty
                      ? const Center(
                      child: CustomText(
                      text: "No document found",
                      color: AppColors.black_02,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                      : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    itemCount: min(10, controller.ocrAllList.length),
                    itemBuilder: (context, index) {
                      final item = controller.ocrAllList[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: SizedBox(
                          width: 250,
                          child: CustomDocument(
                            img: "${item.filePath}",
                            title: item.ocrType,
                            description: item.ocrType,
                            uploadedDate: item.formattedUploadDate,
                            status: "New",
                            isStatus: true,
                            onTapView: () {
                              controller.getSingleOcrById(docId: item.id);
                            },
                            onTapShare: () {
                              controller.shareOcrPdf(
                                displayImageUrl: item.filePath,
                                extractionImageUrl: item.textImageUrl,
                                title: item.ocrType,
                              );
                            },
                            onTapDelete: () {
                              controller.deleteDocById(deleteId: item.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }),
        bottomNavigationBar: const HostNavbar(currentIndex: 0),
      ),
    );
  }
}