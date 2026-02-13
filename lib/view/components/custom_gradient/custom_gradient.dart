import 'package:flutter/material.dart';

import '../../../utils/app_images/app_images.dart';

class CustomGradient extends StatelessWidget {
  final Widget child;
  final Color color1;
  final Color color2;

   const CustomGradient({
    super.key,
    required this.child,
    this.color1 = const Color(0xFF0C7A43),
    // this.color2 = const Color(0xFF2DBE60),
    this.color2 = const Color(0xFF0C7A43),
  });

  @override
  Widget build(BuildContext context) {
     return Container(
       height: double.infinity,
       width: double.infinity,
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topRight,
           end: Alignment.bottomCenter,
           colors: [
             color1,
            color2
           ],
         ),
       ),
       child: SafeArea(
         bottom: true,
           top: false,
           child: child,
       ),
     );
  }
}
