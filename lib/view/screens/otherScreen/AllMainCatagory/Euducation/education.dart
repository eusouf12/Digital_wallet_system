import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../Home/Controller/home_controller.dart';
import '../Controller/all_catagory_controller.dart';

class Education extends StatelessWidget {
  Education({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Education",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Form I-20 (Certificate of Eligibility)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Form I-20 (Certificate of Eligibility)");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Form I-20 (Certificate of Eligibility)");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Form I-20 (Certificate of Eligibility)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //DS-2019
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("DS-2019");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "DS-2019");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "DS-2019", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //SEVIS ID
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("SEVIS ID");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "SEVIS ID");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Form I-20 (Certificate of Eligibility)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //University or School ID
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("University or School ID");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "University or School ID");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "University or School ID", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Enrollment Verification Letter
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Enrollment Verification Letter");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Enrollment Verification Letter");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Enrollment Verification Letter", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Transcripts or Diplomas)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Transcripts or Diplomas");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Transcripts or Diplomas");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffCB30E0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Transcripts or Diplomas", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ),

        )
    );
  }
}


