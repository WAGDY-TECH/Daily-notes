import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode for the application
enum ThemeMode { light, dark, system }

/// State for theme management
class ThemeState {
  final ThemeMode mode;
  
  ThemeState({required this.mode});
}

/// Provider for theme state
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

/// Notifier for managing theme state
class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(mode: ThemeMode.system));
  
  /// Initialize theme from preferences
  Future<void> initialize(String themeModeString) async {
    final mode = ThemeMode.values.firstWhere(
      (m) => m.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
    state = ThemeState(mode: mode);
  }
  
  /// Set theme mode
  void setThemeMode(ThemeMode mode) async {
    state = ThemeState(mode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', mode.name);
  }
  
  /// Toggle between light and dark theme
  void toggleTheme() {
    final newMode = state.mode == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;
    setThemeMode(newMode);
  }
  
  /// Get current theme data based on mode
  ThemeData get themeData {
    switch (state.mode) {
      case ThemeMode.light:
        return ThemeData.light();
      case ThemeMode.dark:
        return ThemeData.dark();
      case ThemeMode.system:
      default:
        // Use system preference
        final brightness = WidgetsBinding.instance.window.platformBrightness;
        return brightness == Brightness.light 
            ? ThemeData.light() 
            : ThemeData.dark();
    }
  }
}
