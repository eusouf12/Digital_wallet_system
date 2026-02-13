import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/ToastMsg/toast_message.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../Home/Controller/home_controller.dart';

class AddNewDoc extends StatelessWidget {

  AddNewDoc({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //camera
                GestureDetector(
                  onTap: () async {
                    controller.selectedImage.value = null;
                    await controller.pickImageFromCamera();
                    if (controller.selectedImage.value != null) {
                      Get.toNamed(AppRoutes.documentScannerPage);
                    } else {
                      showCustomSnackBar("Warning, No image selected", isError: true);
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt,color: AppColors.white),
                          CustomText(text: "Scan Document",left: 15, fontSize: 20, fontWeight: FontWeight.w500)
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10,),
                // local device storage
                GestureDetector(
                  onTap: ()async{
                    controller.selectedImage.value = null;
                    await controller.pickImageFromGallery();
                    if (controller.selectedImage.value != null) {
                      Get.toNamed(AppRoutes.documentScannerPage);
                    } else {
                      showCustomSnackBar("Warning, No image selected", isError: true);
                    }
                },
                  child: Container(
                      width: double.infinity,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImage(imageSrc: AppIcons.file,imageColor: AppColors.white,),
                          CustomText(text: "Upload File",left: 15, fontSize: 20, fontWeight: FontWeight.w500)
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10,),
                // cloud storage
                // GestureDetector(
                //   onTap: () async {
                //     controller.selectedImage.value = null;
                //
                //     // Dummy Example URL (replace with actual cloud URL)
                //
                //     await controller.pickImageFromCloud();
                //
                //     if (controller.selectedImage.value != null) {
                //       Get.toNamed(AppRoutes.documentScannerPage);
                //     } else {
                //       showCustomSnackBar("Unable to import from cloud", isError: true);
                //     }
                //   },
                //   child: Container(
                //       width: double.infinity,
                //       height: 56.h,
                //       decoration: BoxDecoration(
                //         color: AppColors.primary1,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(Icons.cloud,color: AppColors.black),
                //           CustomText(text: "Import from Cloud",left: 15, fontSize: 20, fontWeight: FontWeight.w500)
                //         ],
                //       )
                //   ),
                // ),
                SizedBox(height: 50,),

                GestureDetector(
                    onTap: (){
                       Get.toNamed(AppRoutes.addDocument);
                    },
                    child: CustomText(
                        text: "Cancel",
                        fontSize: 18,color: AppColors.black,
                        fontWeight: FontWeight.w500)
                ),
              ],
            ),
          ),
        )
    );
  }
}



