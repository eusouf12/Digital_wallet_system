import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_nav_bar/navbar.dart';
import 'package:omerabashar_flutter_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/Home/widget/custom_document.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../components/custom_text/custom_text.dart';
import 'Widget/custom_doc_card.dart';


class AddDocument extends StatelessWidget {
  const AddDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomGradient(
        color1: AppColors.white_2,
        color2: AppColors.white_2,
        child:Scaffold(
          backgroundColor: AppColors.white_2,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: BackButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.homeScreen);
                  },
                  color: AppColors.black,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: "Add Document",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                const SizedBox(height: 4), // spacing
                CustomText(
                  text: "Choose Category",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.6),
                ),
              ],
            ),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                    // Get.toNamed(AppRoutes.addNewDoc);
                    },
                    child: Container(
                        width: double.infinity,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: CustomText(text: " + Custom Document", fontSize: 20, fontWeight: FontWeight.w500))
                    ),
                  ),

                  SizedBox(height: 10,),
                  //identity
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomDocumentCard(
                            title: "Identity",
                            icon: "🪪",
                            bgColor: Color(0xff0088FF).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.identity);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDocumentCard(
                            title: "Instant E-Verify & Immigration",
                            icon: "🛂",
                            bgColor: Color(0xff00C3D0).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.eVerification);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),
                  //Citizenship
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomDocumentCard(
                            title: "Citizenship ",
                            icon: "🪪",
                            bgColor: Color(0xff000080).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.citizenship);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDocumentCard(
                            title: "Employment & Tax",
                            icon: "💼",
                            bgColor: Color(0xff808000).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.employment);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),
                  //Residence & Utilities
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomDocumentCard(
                            title: "Residence & Utilities ",
                            icon: "🏠",
                            bgColor: Color(0xff8E8E93).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.residence);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDocumentCard(
                            title: "Education",
                            icon: "🎓",
                            bgColor: Color(0xffCB30E0).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.education);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),
                  //Healthcare
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomDocumentCard(
                            title: "Healthcare",
                            icon: "🏥",
                            bgColor: Color(0xff34C759).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.healthcare);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDocumentCard(
                            title: "Transportation",
                            icon: "🚗",
                            bgColor: Color(0xffFF8D28).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.transportation);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),
                  //Financial
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomDocumentCard(
                            title: "Financial",
                            icon: "💳",
                            bgColor: Color(0xffFFD700).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.financial);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDocumentCard(
                            title: "Legal & Rights",
                            icon: "⚖️",
                            bgColor: Color(0xffFF383C).withOpacity(0.6),
                            onTap: () {
                              Get.toNamed(AppRoutes.legalRights);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),

                ],
              ),
            ),
          ),


        )
    );
  }
}
