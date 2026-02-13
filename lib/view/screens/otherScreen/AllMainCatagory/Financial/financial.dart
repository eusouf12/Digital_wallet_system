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

class Financial extends StatelessWidget {
  Financial({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Financial",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Bank Account Verification Letter
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Bank Account Verification Letter");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Bank Account Verification Letter");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFD700).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Bank Account Verification Letter", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Bank Account Verification Letter
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Bank Account Verification Letter");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Bank Account Verification Letter");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFD700).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Bank Account Verification Letter", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Credit
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Debit/Credit Cards ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Debit/Credit Cards ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFD700).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Debit/Credit Cards ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Proof of Funds / Bank Statements
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Proof of Funds / Bank Statements");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Proof of Funds / Bank Statements");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFD700).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Proof of Funds / Bank Statements", fontSize: 18, fontWeight: FontWeight.w500))
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


