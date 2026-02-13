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

class LegalRights extends StatelessWidget {
  LegalRights({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "LegalRights",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Immigration Court Documents
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Immigration Court Documents");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Immigration Court Documents");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Immigration Court Documents", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Legal Representation Letters (Attorney G-28 form)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("ILegal Representation Letters ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Legal Representation Letters");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Legal Representation Letters (Attorney G-28 form)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Know Your Rights Card (custom digital card)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Know Your Rights Card ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Know Your Rights Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Know Your Rights Card (custom digital card)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Power of Attorney / Guardianship forms
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Power of Attorney / Guardianship forms");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Power of Attorney / Guardianship forms");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Power of Attorney / Guardianship forms", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //ICE Check-In Notices or Release Papers
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("ICE Check-In Notices or Release Papers");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "ICE Check-In Notices or Release Papers");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "ICE Check-In Notices or Release Papers", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Immigration Bond Receipts");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Immigration Bond Receipts");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFF383C).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Immigration Bond Receipts", fontSize: 18, fontWeight: FontWeight.w500))
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


