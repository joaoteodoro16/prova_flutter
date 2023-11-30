import 'package:flutter/material.dart';

import '../ui/app_colors.dart';

class ContainerBackgroundLinearGradiente extends StatelessWidget {

  const ContainerBackgroundLinearGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradientBlue, AppColors.gradientGreen],
        ),
      ),
    );
  }
}
