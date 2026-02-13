import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_const/app_const.dart';
import 'package:omerabashar_flutter_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:omerabashar_flutter_app/view/components/custom_text/custom_text.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';

class DriverLicenseScreen extends StatelessWidget {
  const DriverLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Back Button
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: BackButton(
                        onPressed: () {
                          Get.back();
                        },
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title
                    CustomText(
                      text: "Add Document",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    print("Verify tapped");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomText(
                      text: "Verify",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNetworkImage(
                          imageUrl: AppConstants.ntrition,
                          height: 200,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SizedBox(height: 10,),
                        //Document Details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: 'Issued By', fontWeight: FontWeight.w500,color: AppColors.black_05,),
                                  SizedBox(height: 5,),
                                  CustomText(text: 'DVM California',fontSize: 16,color: AppColors.black,),
                                  SizedBox(height: 20,),
                                  CustomText(text: 'Expiry', fontWeight: FontWeight.w500,color: AppColors.black_05,),
                                  SizedBox(height: 5,),
                                  CustomText(text: 'Mar 15,2028',fontSize: 16,color: AppColors.black,),
                                  SizedBox(height: 20,),
                                  CustomText(text: 'Category', fontWeight: FontWeight.w500,color: AppColors.black_05,),
                                  SizedBox(height: 5,),
                                  CustomText(text: 'Government ID',fontSize: 16,color: AppColors.black,)
                                ]
                            ),
                            SizedBox(width: 30,),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(text: 'Issued Date',fontWeight: FontWeight.w500,color: AppColors.black_05,),
                                  SizedBox(height: 5,),
                                  CustomText(text: 'Mar 15,2028',fontSize: 16,color: AppColors.black,),
                                  SizedBox(height: 20,),
                                  CustomText(text: 'Document No',fontWeight: FontWeight.w500,color: AppColors.black_05,),
                                  SizedBox(height: 5,),
                                  CustomText(text: 'D1234567',fontSize: 16,color: AppColors.black,)
                                ]
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        //share and
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.primary1,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 10),
                                    CustomText(
                                      text: 'Share\nSecurely',
                                      left: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.primary1,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 10),
                                    CustomText(
                                      text: 'Download\nPDF',
                                      fontWeight: FontWeight.w600,
                                      left: 10,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        // delete and set remainder
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: AppColors.primary,
                                      size: 15,
                                    ),
                                    CustomText(
                                      text: 'Set \n Reminder',
                                      fontWeight: FontWeight.w600,
                                      left: 10,
                                      color: AppColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: AppColors.red,
                                      size: 15,
                                    ),
                                    CustomText(
                                      text: 'Delete',
                                      left: 10,
                                      color: AppColors.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(color:AppColors.black_05),
                        SizedBox(height: 10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Uploaded on Nov 8, 2025',color: AppColors.black_05,),
                              CustomText(text: '2.4 MB',color: AppColors.black_05)
                            ]
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

