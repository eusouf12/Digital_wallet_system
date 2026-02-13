import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_images/app_images.dart';
import 'package:omerabashar_flutter_app/view/components/custom_image/custom_image.dart';
import 'package:omerabashar_flutter_app/view/components/custom_loader/custom_loader.dart';
import 'package:omerabashar_flutter_app/view/screens/otherScreen/profile_screen/controller/profile_controller.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_from_card/custom_from_card.dart';
import '../../../components/custom_gradient/custom_gradient.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';

class HelpSupport extends StatelessWidget {
   HelpSupport({super.key});
   final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: 'Help & Support',
          color: AppColors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //img
                 Center(
                   child: Column(
                     children: [
                       CustomImage( imageSrc: AppImages.help,),
                       SizedBox(height: 20,),
                       CustomText(text: "Hello, how can we assist you?", fontSize: 16, fontWeight: FontWeight.w500,)
                     ],
                   ),
                 ),
                  SizedBox(height: 20,),
                  CustomFormCard(
                    title: 'Title',
                    hintText: 'Enter the title of your issue',
                    fillBorderRadius: 12,
                    controller: profileController.titleHelpController.value,
                  ),
                  CustomFormCard(
                    title: 'Write in bellow box',
                    hintText: 'Write here.....',
                    maxLine: 5,
                    fillBorderRadius: 12,
                    controller: profileController.desHelpController.value,
                  ),
                  SizedBox(height: 40,),

          Obx(() {
            return profileController.helpLoading.value
                ? const Center(child: CustomLoader())
                : CustomButton(
              onTap: () {
                profileController.postHelpAndSupport();
              },
              title: 'Send',
              textColor: AppColors.white,
              borderRadius: 50,
              fillColor: AppColors.primary1,
              fontSize: 14,
              );
          })
                 
                ]
            ),
          ),
        ),
      ),
    );
  }
}
