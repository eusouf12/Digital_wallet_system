import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/components/custom_text/custom_text.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class SaveChange extends StatelessWidget {
  const SaveChange({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(AppRoutes.documentSavedScreen);
      });
    });

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
      
              Icon(Icons.cloud_upload, size: 80, color: AppColors.primary,),
              const SizedBox(height: 20),
              CustomText(
                  text: "Uploading\n Your Document...",
                  fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.black,
              ),
              const SizedBox(height: 10),
              const Text('Please wait while we process your file.', style: TextStyle(fontSize: 14),),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
      
              //Static success message (since progress removed)
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.greenAccent.withOpacity(0.15),
                child: Row(
                  children: [
                    const Icon(Icons.security, color: AppColors.primary1,),
                    const SizedBox(width: 10),

                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Secure Upload",
                              style: TextStyle(
                                color: AppColors.primary1,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                              ": Your file is encrypted and securely uploaded with end-to-end protection.",
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
