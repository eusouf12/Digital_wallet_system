import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/view/screens/splashScreen/payment/pay_pal_button_screen.dart';

import 'controller/subscribe_controller.dart';

class SubscribeScreen extends StatelessWidget {
  SubscribeScreen({super.key});
  final SubscribeController subscribeController = Get.put(SubscribeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF2D9B5F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Get Started with\nDigital ID Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Subscribe to unlock your secure\ndigital wallet.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Phone Mockup Section
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFF4DB8E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xFF90EE90),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF90EE90),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Why Digital ID Wallet Link
              Obx(() {
                return TextButton(
                  onPressed: subscribeController.isLoading.value
                      ? null
                      : () async {
                    subscribeController.isLoading.value = true;
                    await subscribeController.fetchSubscriptionStatus();
                  },
                  child: subscribeController.isLoading.value
                      ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    'Skip Video & \nContinue to ICE Verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              // Subscription Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Subscribe Now to Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Gain access to all features for\nsecure document storage and\neasy management.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2D9B5F),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$60.00',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D9B5F),
                          ),
                        ),
                        SizedBox(width: 4),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            '/ year',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(PayPalButton());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2DBE60),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Subscribe Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Features Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildFeatureItem(
                      Icons.lock,
                      'Secure Storage',
                      'Bank-level encryption keeps your documents safe and private.',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureItem(
                      Icons.folder,
                      'Easy Management',
                      'Organize and access all your documents in one convenient place.',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureItem(
                      Icons.favorite,
                      'Peace of Mind',
                      'Know your important documents are always secure and accessible.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Footer
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  '© 2025 Digital ID Wallet. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration:  BoxDecoration(
            color: AppColors.primary.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.amberAccent,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
