import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../Home/Controller/home_controller.dart';

class Employment extends StatelessWidget {
  Employment({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Employment",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Social Security Number (SSN)  documentation
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Social Security Number (SSN) or ITIN documentation");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Social Security Number (SSN) or ITIN documentation");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Social Security Number (SSN) or ITIN documentation", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Form I-9 (Employment Eligibility Verification)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Form I-9 (Employment Eligibility Verification)");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Form I-9 (Employment Eligibility Verification)");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Form I-9 (Employment Eligibility Verification)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  // Pay Stubs or Employer Verification Letters
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Pay Stubs or Employer Verification Letters");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Pay Stubs or Employer Verification Letters");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Pay Stubs or Employer Verification Letters", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //W-2 / 1099 Tax Forms
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("W-2 / 1099 Tax Forms");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "W-2 / 1099 Tax Forms");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "W-2 / 1099 Tax Forms", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("IRS Tax Transcripts");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "IRS Tax Transcripts ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "IRS Tax Transcripts", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),

                ],
              ),
            ),
          ),

        )
    );
  }
}


