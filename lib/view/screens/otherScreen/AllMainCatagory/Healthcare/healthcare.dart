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

class Healthcare extends StatelessWidget {
  Healthcare({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Healthcare",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Health Insurance Card (Medicaid, Medicare, private, etc.)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Health Insurance Card ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Health Insurance Card ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff34C759).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Health Insurance Card (Medicaid, Medicare, private, etc.)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Vaccination Records
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Vaccination Records");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Vaccination Records");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff34C759).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Vaccination Records", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Medical ID or emergency contact info
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Medical ID or emergency contact info");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Medical ID or emergency contact info");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff34C759).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Medical ID or emergency contact info", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Health-related immigration exam (Form I-693)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Health-related immigration exam (Form I-693)");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Health-related immigration exam (Form I-693)");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff34C759).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Health-related immigration exam (Form I-693)", fontSize: 18, fontWeight: FontWeight.w500))
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


