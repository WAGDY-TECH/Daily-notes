import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

/// Loading indicator widget
class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingIndicator({
    super.key,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final indicatorColor = color ?? AppColors.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
        backgroundColor: isDark 
            ? AppColors.backgroundDark.withOpacity(0.5)
            : AppColors.backgroundLight.withOpacity(0.5),
      ),
    );
  }
}

/// Full screen loading overlay
class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: LoadingIndicator(size: 50),
      ),
    );
  }
}
