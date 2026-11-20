import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/providers/language_provider.dart';
import 'config/routes.dart';

class DailyNotesApp extends ConsumerWidget {
  final String initialThemeMode;
  final String initialLanguage;

  const DailyNotesApp({
    super.key,
    required this.initialThemeMode,
    required this.initialLanguage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize theme and language providers
    ref.read(themeProvider.notifier).initialize(initialThemeMode);
    ref.read(languageProvider.notifier).initialize(initialLanguage);
    
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    
    return MaterialApp.router(
      title: 'Daily Notes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeState.mode,
      locale: Locale(languageState.locale),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        // Add localization delegates here
      ],
      routerConfig: AppRoutes.router,
    );
  }
}
