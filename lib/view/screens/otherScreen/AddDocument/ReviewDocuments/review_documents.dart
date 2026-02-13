import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';

import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_from_card/custom_from_card.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text/custom_text.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
        appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Review Your Document',),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                //img
                Card(
                  color: AppColors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Document Preview', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black,),
                        SizedBox(height: 10,),
                        CustomNetworkImage(
                          imageUrl: AppConstants.ntrition,
                          height: 200,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.fullscreen_sharp, color: AppColors.primary1,),
                            SizedBox(height: 15),
                            CustomText(text: 'View Full Size',color: AppColors.primary1, fontWeight: FontWeight.w500, )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //type
                Card(
                  color: AppColors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                        title: 'Document Type',
                        hintText: 'Passport',
                        titleColor: AppColors.black1,
                        curserColor: AppColors.black1,
                        inputTextColor: AppColors.black1,
                        fillBorderRadius: 12,
                        fieldBorderColor: AppColors.black_06,
                        controller: TextEditingController()),
                  ),
                ),
                SizedBox(height: 10,),
                //name
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                        title: 'Full Name',
                        hintText: 'Eusof Uddin',
                        titleColor: AppColors.black1,
                        curserColor: AppColors.black1,
                        inputTextColor: AppColors.black1,
                        fillBorderRadius: 12,
                        fieldBorderColor: AppColors.black_06,
                        controller: TextEditingController()),
                  ),
                ),
                SizedBox(height: 10,),
                //number
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                        title: 'Document Number',
                        hintText: 'P123456',
                        titleColor: AppColors.black1,
                        curserColor: AppColors.black1,
                        inputTextColor: AppColors.black1,
                        fillBorderRadius: 12,
                        fieldBorderColor: AppColors.black_06,
                        controller: TextEditingController()
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //authority
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                        title: 'Issuing Authority',
                        hintText: 'US Department of State',
                        titleColor: AppColors.black1,
                        curserColor: AppColors.black1,
                        inputTextColor: AppColors.black1,
                        fillBorderRadius: 12,
                        fieldBorderColor: AppColors.black_06,
                        controller: TextEditingController()
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //issue date
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                      controller: TextEditingController(),
                      title: 'Issue Date',
                      hintText: '2019-03-15',
                      titleColor: AppColors.black1,
                      curserColor: AppColors.black1,
                      inputTextColor: AppColors.black1,
                      fillBorderRadius: 12,
                      fieldBorderColor: AppColors.black_06,
                      suffixIcon: Icon(Icons.calendar_month, color: AppColors.black1,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // expire date
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                      title: 'Expiry Date',
                      hintText: '2029-03-15',
                      titleColor: AppColors.black1,
                      curserColor: AppColors.black1,
                      inputTextColor: AppColors.black1,
                      fillBorderRadius: 12,
                      fieldBorderColor: AppColors.black_06,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.calendar_month, color: AppColors.black1,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //country
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormCard(
                      title: 'Country / Region',
                      hintText: 'United States',
                      titleColor: AppColors.black1,
                      curserColor: AppColors.black1,
                      inputTextColor: AppColors.black1,
                      fillBorderRadius: 12,
                      fieldBorderColor: AppColors.black_06,
                      controller: TextEditingController(),
                      suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.black1,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                CustomButton(onTap: (){
                     Get.toNamed(AppRoutes.saveChange);
                },
                  title: 'Save Changes',
                  fillColor: AppColors.primary,
                  textColor: AppColors.white,
                  icon: Icon(Icons.save, color: AppColors.white, size: 20,),
                ),
                SizedBox(height: 10,),
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.driverLicenseScreen);
                  },
                  title: 'Send for Verification',
                  isBorder: true,
                  borderColor: AppColors.primary,
                  borderWidth: 2,
                  borderRadius: 12,
                  textColor: AppColors.primary,
                  icon: Icon(Icons.verified, color: AppColors.primary,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}