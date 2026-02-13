import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_loader/custom_loader.dart';
import 'package:omerabashar_flutter_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../service/api_url.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../Controller/home_controller.dart';
import '../widget/custom_document.dart';

class RecentDocument extends StatelessWidget {
  RecentDocument({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchOcrListRecent();
    });

    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: "Recent Document",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CustomLoader(color: AppColors.black,));
            }
            if (controller.ocrList.isEmpty) {
              return const Center(child: Text("No documents found"));
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount:controller.ocrList.length,
              itemBuilder: (context, index) {
                final item = controller.ocrList[index];
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
            );
          }),
        ),
      ),
    );
  }
}
