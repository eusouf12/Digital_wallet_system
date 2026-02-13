import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/AllMainCatagory/Controller/all_catagory_controller.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../Home/Controller/home_controller.dart';

class Identity extends StatelessWidget {
  Identity({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Core Identity Documents",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Passport
                  GestureDetector(
                    onTap: (){
                    allCategoryController.setType("Passport");
                    Get.toNamed(AppRoutes.addNewDoc, arguments: "Passport");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Passport ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Driver’s License
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Driver’s License");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Driver’s License");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Driver’s License or State ID Card ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Birth Certificate
                  GestureDetector(
                    onTap: (){
                       allCategoryController.setType("Birth Certificate");
                       Get.toNamed(AppRoutes.addNewDoc, arguments: "Birth Certificate");
                      },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Birth Certificate ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Consular ID
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Consular ID");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Consular ID");
                      },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Consular ID ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Social Security Card
                  GestureDetector(
                    onTap: (){
                    allCategoryController.setType("Social Security Card");
                    Get.toNamed(AppRoutes.addNewDoc, arguments:"Social Security Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Social Security Card ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Tribal ID
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Tribal ID");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Tribal ID");
                      },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff0088FF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Tribal ID ", fontSize: 18, fontWeight: FontWeight.w500))
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


