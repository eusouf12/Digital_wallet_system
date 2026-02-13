import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_gradient/custom_gradient.dart';
import '../../../components/custom_loader/custom_loader.dart';
import '../../../components/custom_pin_code/custom_pin_code.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';
import '../controller/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final SignUpAuthModel userModel = Get.arguments as SignUpAuthModel;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.startOtpTimer();
    });
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                //upper text
                Center(
                  child: Column(
                    children: [
                      CustomText(
                        text: "ICE VERIFY",
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      CustomText(
                        text: "DIGITAL ID WALLET",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white_1,
                        bottom: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Title
                Center(
                  child: CustomText(
                    text: "VERIFY OTP",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    bottom: 10,
                  ),
                ),

                // Description
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: CustomText(
                      text: "Enter the 6-digit code sent to your email or phone number.",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_2,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Custom OTP
                CustomPinCode(
                  controller: authController.otpController.value,
                  // controller: otpController,
                ),
                const SizedBox(height: 15),
                userModel.screenName == "Sign up"?
                  Obx(() {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: authController.canResend.value
                                ? "You can resend now"
                                : "Resend code in 00:${authController.otpTimer.value.toString().padLeft(2, '0')}",
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey_2,
                          ),
                        ],
                      ),
                    );
                  }):const SizedBox(),
                const SizedBox(height: 30),
                // Verify Button
              Obx(() {
                return authController.otpLoading.value
                    ? CustomLoader()
                    :CustomButton(
                  onTap: () {
                    if (authController.otpController.value.text.isEmpty) {
                      showCustomSnackBar(
                        "Field Can't Be Empty",
                        isError: true,
                      );
                      return;
                    }
                    userModel.screenName == "Sign up"
                        ? authController.verifyOtp(screenName: userModel.screenName,)
                        : authController.verifyOtpForgetPass();
                  },
                  borderRadius: 12,
                  textColor: AppColors.white,
                  fillColor: AppColors.primary1,
                  title: "Verify",
                  fontSize: 16,
                );
              }),
                const SizedBox(height: 24),
                //Resend
                Obx(() {
                  if (!authController.canResend.value) {
                    return const SizedBox();
                  }

                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Didn't receive the code? ",
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey_2,
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint("Resend OTP ======== ${userModel.screenName}");
                            authController.resendOtp(email: userModel.email);
                          },
                          child: CustomText(
                            text: "Resend",
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFDD835),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
                // Back to Login
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                    child: const CustomText(
                        text: "Back to Login",
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFDD835)
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}

