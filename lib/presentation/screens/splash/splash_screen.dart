import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/colors.dart';
import '../../providers/theme_provider.dart';
import '../../providers/language_provider.dart';
import '../../widgets/common/loading_indicator.dart';

/// Splash screen displayed when the app starts
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Initialize theme and language from preferences
    await ref.read(themeProvider.notifier).loadTheme();
    await ref.read(languageProvider.notifier).loadLanguage();
    
    // Simulate loading time (remove in production)
    await Future.delayed(const Duration(seconds: 2));
    
    // Navigate to home screen
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    final isDark = themeState.mode == ThemeMode.dark;
    final isArabic = languageState.isArabic;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.note_alt_outlined,
                size: 60,
                color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
              ),
            ),
            const SizedBox(height: 24),
            
            // App name
            Text(
              isArabic ? 'يومياتي' : 'Daily Notes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Tagline
            Text(
              isArabic ? 'نظام إدارة يوميات المستشفى' : 'Hospital Daily Notes System',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Loading indicator
            const LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
