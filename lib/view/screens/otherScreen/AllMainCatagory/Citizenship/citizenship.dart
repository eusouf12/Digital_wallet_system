import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/Home/Controller/home_controller.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';

class Citizenship extends StatelessWidget {
  Citizenship({super.key});
  final HomeController allCategoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Citizenship",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Certificate of Naturalization
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Certificate of Naturalization ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Certificate of Naturalization ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff000080).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Certificate of Naturalization (Form N-550/N-570)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                 //Certificate of Citizenship (Form N-560/N-561)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Certificate of Citizenship ");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Certificate of Citizenship ");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff000080).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Certificate of Citizenship (Form N-560/N-561)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                 //U.S. Passport (digital copy)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("U.S. Passport (digital copy)");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "U.S. Passport (digital copy)");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff000080).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "U.S. Passport (digital copy)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Voter Registration Card
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Voter Registration Card");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Voter Registration Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff000080).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Voter Registration Card (for U.S. citizens)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                 //Certificate of Naturalization
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Oath Ceremony Notice");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Oath Ceremony Notice");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff000080).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Oath Ceremony Notice (Form N-445)", fontSize: 18, fontWeight: FontWeight.w500))
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


