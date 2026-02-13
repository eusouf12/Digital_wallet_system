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

class Transportation extends StatelessWidget {
  Transportation({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Transportation",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
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
                          color: Color(0xffFF8D28).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Driver’s License", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                   //Vehicle Registration
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Vehicle Registration");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Vehicle Registration");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF8D28).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Vehicle Registration", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                 //Auto Insurance Card
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Auto Insurance Card");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Auto Insurance Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF8D28).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Auto Insurance Card", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                 //International Driving Permit (if applicable)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("International Driving Permit (if applicable)");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "International Driving Permit (if applicable)");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF8D28).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "International Driving Permit (if applicable)", fontSize: 18, fontWeight: FontWeight.w500))
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


