import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omerabashar_flutter_app/utils/app_colors/app_colors.dart';
import 'package:omerabashar_flutter_app/utils/app_const/app_const.dart';
import 'package:omerabashar_flutter_app/view/components/custom_netwrok_image/custom_network_image.dart';
import '../../../../components/custom_text/custom_text.dart';

class CustomDocument extends StatelessWidget {
  const CustomDocument({
    super.key,
    this.title,
    this.img,
    this.description,
    this.uploadedDate,
    this.status,
    this.statusColor,
    required this.onTapView,
    required this.onTapShare,
    required this.onTapDelete, this.isStatus,
  });

  final String? title;
  final String? img;
  final String? description;
  final String? uploadedDate;
  final String? status;
  final bool? isStatus;
  final Color? statusColor;
  final VoidCallback onTapView;
  final VoidCallback onTapShare;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white_2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ============= IMAGE SECTION =============
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: CustomNetworkImage(
                      imageUrl:img ?? AppConstants.banner,
                      boxShape: BoxShape.rectangle,
                      height:MediaQuery.of(context).size.height * 0.70,
                      width: double.infinity,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),

                // STATUS BADGE
                if (isStatus != true)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: statusColor ?? AppColors.yellow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.verified, size: 12, color: AppColors.primary),
                          SizedBox(width: 4),
                          CustomText(
                            text: status!,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),

                // MAIN CONTENT ON BACKGROUND
                Positioned(
                  left: 14,
                  bottom: 14,
                  right: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TITLE
                      // CustomText(
                      //   text: (title ?? "Driver License").tr,
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.white,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      SizedBox(height: 6),

                      // DESCRIPTION
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary1,
                        ),
                        child: CustomText(
                          text: (description ?? "Identity").tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // UPLOADED DATE
                      CustomText(
                        text: "Uploaded: ${uploadedDate ?? 'Dec 15, 2024'}",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //================= BOTTOM ACTIONS =================
          Material( // ✅ Material wrapper যোগ করুন
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// VIEW
                    Expanded(
                      child: InkWell(
                        onTap: onTapView,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.visibility_outlined,
                                  color: Colors.white, size: 20),
                              const SizedBox(height: 4),
                              CustomText(
                                text: "View",
                                fontSize: 11,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// SHARE
                    Expanded(
                      child: InkWell(
                        onTap: onTapShare,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.share_outlined,
                                  color: Colors.white, size: 20),
                              const SizedBox(height: 4),
                              CustomText(
                                text: "Share".tr,
                                fontSize: 11,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// DELETE
                    Expanded(
                      child: InkWell(
                        onTap: onTapDelete,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.delete_outline,
                                  color: Colors.white, size: 20),
                              const SizedBox(height: 4),
                              CustomText(
                                text: "Delete",
                                fontSize: 11,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}