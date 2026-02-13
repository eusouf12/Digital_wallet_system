import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_button/custom_button.dart';

import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_gradient/custom_gradient.dart';
import '../../../../components/custom_text/custom_text.dart';

class DocumentSavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      color1: AppColors.white_2,
      color2: AppColors.white_2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 80,
                color:AppColors.primary1,
              ),
              SizedBox(height: 20),
              CustomText(
                text: "Document Saved \nSuccessfully!",
                fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.black,
              ),

              SizedBox(height: 10),
              Text(
                'You can view and manage this file in Your Wallet.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              // Go to My Documents Button
              CustomButton(onTap:(){

              },
                title: 'Go to My Documents',
                fillColor: AppColors.primary1,
                textColor: AppColors.white,
              ),

              SizedBox(height: 10),
              // Add Another Document Button
              CustomButton(onTap:(){
                   Get.offNamed(AppRoutes.addNewDoc);
              },
                title: 'Add Another Documents',
                fillColor: AppColors.black_06,
                textColor: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}