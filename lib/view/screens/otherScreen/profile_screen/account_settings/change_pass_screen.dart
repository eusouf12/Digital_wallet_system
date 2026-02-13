import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/view/components/custom_gradient/custom_gradient.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/profile_screen/controller/profile_controller.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_from_card/custom_from_card.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../authentication_screen/controller/auth_controller.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Change Password', color: AppColors.white,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              CustomFormCard(
                title: 'Current Password',
                hintText: '******',
                isPassword: true,
                fillBorderRadius: 12,
                controller: profileController.oldPasswordController.value,
              ),
              CustomFormCard(
                title: 'New Password',
                hintText: '******',
                isPassword: true,
                fillBorderRadius: 12,
                controller: profileController.newPasswordController.value,

                onChanged: (value) {
                  authController.validatePasswordLive(value);
                },
                validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Enter Your Password';
                   }
                   if (authController.passwordError.value.isNotEmpty) {
                       return authController.passwordError.value;
                   }
                   return null;
                   },
              ),
              CustomFormCard(
                title: 'Confirm Password',
                hintText: '******',
                isPassword: true,
                fillBorderRadius: 12,
                controller: profileController.confirmPasswordController.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.confirmPassword;
                  } else if (value !=
                      profileController.newPasswordController.value.text) {
                    return AppStrings.passwordNotMatch;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24,vertical: 30),
          child: CustomButton(
            onTap: () {
              profileController.changePassword();
            },
            title: 'Update Password',
            fillColor: AppColors.primary1,
            textColor: AppColors.white,
            fontSize: 16,
            borderRadius: 10,
          ),
        ),
      ),
    );
  }
}
