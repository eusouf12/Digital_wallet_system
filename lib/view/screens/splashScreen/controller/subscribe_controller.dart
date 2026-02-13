import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/helper/shared_prefe/shared_prefe.dart';
import 'package:omerabashar_flutter_app/utils/app_const/app_const.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../service/api_client.dart';
import '../../../../service/api_url.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../payment/pay_pal_button_screen.dart';

class SubscribeController extends GetxController {
  var isAvailable = false.obs;
  var isLoading = false.obs;

  Future<void> fetchSubscriptionStatus() async {
    isLoading.value = true;

    try {
      final response = await ApiClient.getData(ApiUrl.subscriptionExist);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;

        isAvailable.value = data["data"]["isAvailable"];
        isAvailable.value == true
            ? Get.offAllNamed(AppRoutes.homeScreen)
            : Get.to(PayPalButton());

        debugPrint("✔ isAvailable: ${isAvailable.value}");
      } else {
        Get.snackbar(
          "Error",
          "HTTP Error: ${response.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint("catch ===================== .  Available: ${e.toString()}");
      Get.snackbar(
        "Exception",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  RxBool buySubLoading = false.obs;

  Future<void> postBuySubscription() async {
    buySubLoading.value = true;
    final String id = await SharePrefsHelper.getString(AppConstants.userId);

    Map<String, dynamic> body = {"subscriptionId": id };
      try {
      dynamic response = await ApiClient.postData(ApiUrl.signUp, jsonEncode(body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        buySubLoading.value = false;
        refresh();

        Map<String, dynamic> jsonResponse;
        (response.body is String)? jsonResponse = jsonDecode(response.body) : jsonResponse = response.body as Map<String, dynamic>;

        showCustomSnackBar(jsonResponse['message']?.toString() ?? "Registration successful! Please verify your email.", isError: false);

        Get.offAllNamed(AppRoutes.subscribeScreen);

      }
      else {
        showCustomSnackBar(response['message']?.toString()  ?? "Create post failed", isError: true,);
      }
    } catch (e) {
      showCustomSnackBar("An error occurred. Please try again.", isError: true);
      debugPrint("SignUp Error: $e");
    }finally {
        buySubLoading.value = false;
      }
  }



}
