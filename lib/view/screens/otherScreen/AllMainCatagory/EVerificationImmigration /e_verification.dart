import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../Home/Controller/home_controller.dart';

class EVerification extends StatelessWidget {
  EVerification({super.key});
  final HomeController allCategoryController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          appBar: CustomRoyelAppbar(leftIcon: true,titleName: "EVerification",),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: [
                  //Permanent Resident Card
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Permanent Resident Card");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Permanent Resident Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Permanent Resident Card (Green Card)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Employment Authorization Document (EAD)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Employment Authorization Document");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Employment Authorization Document");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Employment Authorization Document (EAD)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //I-94 Arrival/Departure Record
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("I-94 Arrival/Departure Record");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "I-94 Arrival/Departure Record");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "I-94 Arrival/Departure Record ", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //I-797 Notice of Action (for pending applications or status updates)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("I-797 Notice of Action");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "I-797 Notice of Action");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "I-797 Notice of Action (for pending applications or status updates)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Visa pages from passport (B1/B2, F1, J1, H1B, etc.)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Visa pages from passport");
                      Get.toNamed(AppRoutes.addNewDoc, arguments:"Visa pages from passport");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Visa pages from passport (B1/B2, F1, J1, H1B, etc.)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Form I-20 (for F1/M1 students)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Form I-20");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Form I-20");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Form I-20 (for F1/M1 students)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Form DS-2019 (for J1 exchange visitors)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Form DS-2019");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Form DS-2019");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Form DS-2019 (for J1 exchange visitors)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Advance Parole Document (Form I-512)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Advance Parole Document");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Advance Parole Document");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Advance Parole Document (Form I-512)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Refugee Travel Document or Asylum Approval Notice
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Refugee Travel Document or Asylum Approval Notice");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Refugee Travel Document or Asylum Approval Notice");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Refugee Travel Document or Asylum Approval Notice", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Temporary Protected Status (TPS) approval notice
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Temporary Protected Status approval notice");
                      Get.toNamed(AppRoutes.addNewDoc, arguments:"Temporary Protected Status approval notice");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Temporary Protected Status (TPS) approval notice", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Deferred Action for Childhood Arrivals (DACA) approval and work permit
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Deferred Action for Childhood Arrivals approval and work permit");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Deferred Action for Childhood Arrivals approval and work permit");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Deferred Action for Childhood Arrivals (DACA) approval and work permit", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Re-entry Permit (for green card holders traveling abroad)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Re-entry Permit");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Re-entry Permit");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Re-entry Permit (for green card holders traveling abroad)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Border Crossing Card (for Mexican nationals)
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("Border Crossing Card");
                      Get.toNamed(AppRoutes.addNewDoc, arguments: "Border Crossing Card");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "Border Crossing Card (for Mexican nationals)", fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Temporary Protected Status (TPS) approval notice
                  GestureDetector(
                    onTap: (){
                      allCategoryController.setType("USCIS Case Receipt Numbers");
                      Get.toNamed(AppRoutes.addNewDoc, arguments:"USCIS Case Receipt Numbers");
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xff00C3D0).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: "USCIS Case Receipt Numbers (auto-fetched or stored manually)", fontSize: 18, fontWeight: FontWeight.w500))
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


