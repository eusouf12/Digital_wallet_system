import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../Home/Controller/home_controller.dart';

class UploadDocScreen extends StatelessWidget {


  final controller = Get.put(HomeController());

  UploadDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
       appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Upload Document",),
      
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller.selectedImage.value == null) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Text("No Image Selected"),
                    );
                  }
      
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      controller.selectedImage.value!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
      
                const SizedBox(height: 30),
      
                // 🔘 UPLOAD BUTTON
                Obx(() {
                  return controller.isDocPost.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (controller.selectedImage.value == null) {
                        Get.snackbar("Warning", "Please take a picture first");
                      } else {
                        controller.isDocPost.value = true;
                        controller.createDoc();
                      }
                    },
                    child: const Text("Upload Document"),
                  );
                }),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
