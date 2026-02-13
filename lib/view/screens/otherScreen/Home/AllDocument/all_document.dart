import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/service/api_url.dart';
import 'package:omerabashar_flutter_app/view/components/custom_loader/custom_loader.dart';
import 'package:omerabashar_flutter_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../Controller/home_controller.dart';
import '../widget/custom_document.dart';

class AllDocument extends StatelessWidget {
  AllDocument({super.key});

  final HomeController controller = Get.put(HomeController());

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Fetch first page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllOcrListRecent();
    });

    // Detect scroll to bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !controller.isMoreLoading.value &&
          controller.currentPage <= controller.totalPages) {
        controller.getAllOcrListRecent();
      }
    });

    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: "All Document",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() {
            if (controller.isAllLoading.value && controller.currentPage == 1) {
              // Initial loader
              return const Center(child: CustomLoader(color: AppColors.black));
            }

            if (controller.ocrAllList.isEmpty) {
              return const Center(child: Text("No documents found"));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: controller.ocrAllList.length,
                    itemBuilder: (context, index) {
                      final item = controller.ocrAllList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomDocument(
                          img: "${item.filePath}",
                          title: item.ocrType,
                          description: item.ocrType,
                          uploadedDate: item.formattedUploadDate,
                          status: "New",
                          onTapView: () {
                            controller.getSingleOcrById(docId: item.id);
                          },
                          onTapShare: () {},
                          onTapDelete: () {
                            controller.deleteDocById(deleteId: item.id);
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Bottom loader for pagination
                if (controller.isMoreLoading.value)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CustomLoader(color: AppColors.black),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
