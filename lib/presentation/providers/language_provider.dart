import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// State for language management
class LanguageState {
  final String locale;
  
  LanguageState({required this.locale});
}

/// Provider for language state
final languageProvider = StateNotifierProvider<LanguageNotifier, LanguageState>((ref) {
  return LanguageNotifier();
});

/// Notifier for managing language state
class LanguageNotifier extends StateNotifier<LanguageState> {
  LanguageNotifier() : super(LanguageState(locale: 'ar'));
  
  /// Initialize language from preferences
  Future<void> initialize(String languageCode) async {
    state = LanguageState(locale: languageCode);
  }
  
  /// Set locale
  void setLocale(String locale) async {
    state = LanguageState(locale: locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', locale);
  }
  
  /// Toggle between Arabic and English
  void toggleLanguage() {
    final newLocale = state.locale == 'ar' ? 'en' : 'ar';
    setLocale(newLocale);
  }
  
  /// Get current locale
  Locale get currentLocale {
    return Locale(state.locale);
  }
  
  /// Check if current language is Arabic (RTL)
  bool get isArabic {
    return state.locale == 'ar';
  }
  
  /// Check if current language is English (LTR)
  bool get isEnglish {
    return state.locale == 'en';
  }
}
