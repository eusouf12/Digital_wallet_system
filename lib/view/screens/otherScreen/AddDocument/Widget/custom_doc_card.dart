import 'package:flutter/material.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import '../../../../components/custom_text/custom_text.dart';

class CustomDocumentCard extends StatelessWidget {
  const CustomDocumentCard({
    super.key,
    this.title,
    this.icon,
    this.bgColor,
    required this.onTap,
  });

  final String? title;
  final String? icon;
  final Color? bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primary1, // dynamic color
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Text(
              icon ?? "🪪",
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 10),
            // Title
            CustomText(
              text: title ?? "Identity",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
