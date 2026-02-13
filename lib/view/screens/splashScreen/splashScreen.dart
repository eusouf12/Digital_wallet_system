import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/utils/app_images/app_images.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_image/custom_image.dart';
import 'package:omerabashar_flutter_app/view/components/custom_text/custom_text.dart';

import '../../../core/app_routes/app_routes.dart';
import 'onboarding_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(AppRoutes.onboardingScreen);
      });
    });

    return CustomGradient(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImage(imageSrc: AppImages.splashIcon),
                  CustomText(
                    text: "ICE VERIFY",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    bottom: 2,
                  ),
                  CustomText(
                    text: "DIGITAL ID WALLET",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    bottom: 2,
                  ),
                  CustomText(
                    text: "Secure • Simple • Smart",
                    fontSize: 20.sp,
                    top: 20,
                  ),
                ],
              ),
            ),
          ),

         //TOP CIRCLE
          Positioned(
            top: 170,
            right: -15,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.white_1.withOpacity(0.10),
            ),
          ),
          Positioned(
            top: 100,
            left: -50,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.white_1.withOpacity(0.10),
            ),
          ),
          //Bottom CIRCLE
          Positioned(
            bottom: 60,
            right: 50,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.white_1.withOpacity(0.10),
            ),
          ),
          Positioned(
            bottom: 230,
            left: 0,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.white_1.withOpacity(0.10),
            ),
          ),
        ],
      ),
    );
  }
}






