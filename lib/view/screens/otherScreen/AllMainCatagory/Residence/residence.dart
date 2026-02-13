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

class Residence extends StatelessWidget {
  Residence({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Residence",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Lease or Rental Agreement
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Lease or Rental Agreement");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Lease or Rental Agreement");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Lease or Rental Agreement", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Utility Bills (electricity, gas, water, internet)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Utility Bills");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Utility Bills");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Utility Bills (electricity, gas, water, internet)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Bank or Credit Card Statements
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Bank or Credit Card Statements");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Bank or Credit Card Statements");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Bank or Credit Card Statements", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Mortgage Documents
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Mortgage Documents");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Mortgage Documents");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Mortgage Documents", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Official Mail (e.g., from USCIS, IRS, DMV)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Official Mail");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Official Mail ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff8E8E93).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Official Mail (e.g., from USCIS, IRS, DMV)", fontSize: 18, fontWeight: FontWeight.w500))
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


