import 'package:flutter/material.dart';

/// App color definitions based on the design system
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFFFFC00); // Yellow
  static const Color primaryLight = Color(0xFFFFFD80);
  static const Color primaryDark = Color(0xFFCCC900);
  
  // Background colors
  static const Color backgroundLight = Color(0xFFFFFFFF); // White
  static const Color backgroundDark = Color(0xFF171717); // Black
  
  // Surface colors
  static const Color surfaceLight = Color(0xFFF3F4F6); // Gray
  static const Color surfaceDark = Color(0xFF1F2937);
  static const Color surfaceVariantDark = Color(0xFF374151);
  
  // Text colors
  static const Color textPrimaryLight = Color(0xFF171717); // Black
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // White
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textSecondaryDark = Color(0xFFD1D5DB);
  static const Color textTertiary = Color(0xFF9CA3AF);
  
  // Divider colors
  static const Color dividerLight = Color(0xFFE5E7EB);
  static const Color dividerDark = Color(0xFF374151);
  
  // Status colors - Success
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color successDark = Color(0xFF065F46);
  
  // Status colors - Warning
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color warningDark = Color(0xFF92400E);
  
  // Status colors - Error
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFEE2E2);
  static const Color errorDark = Color(0xFF991B1B);
  
  // Status colors - Info
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);
  static const Color infoDark = Color(0xFF1E40AF);
  
  // Priority colors
  static const Color priorityLow = Color(0xFF6B7280);
  static const Color priorityMedium = Color(0xFF3B82F6);
  static const Color priorityHigh = Color(0xFFF59E0B);
  static const Color priorityCritical = Color(0xFFEF4444);
  
  // Work Order status colors
  static const Color statusPending = Color(0xFFF59E0B);
  static const Color statusAssigned = Color(0xFF3B82F6);
  static const Color statusInProgress = Color(0xFF10B981);
  static const Color statusOnHold = Color(0xFFF59E0B);
  static const Color statusCompleted = Color(0xFF10B981);
  static const Color statusCancelled = Color(0xFFEF4444);
  
  // Task status colors
  static const Color taskPending = Color(0xFF6B7280);
  static const Color taskInProgress = Color(0xFF3B82F6);
  static const Color taskCompleted = Color(0xFF10B981);
  static const Color taskCancelled = Color(0xFFEF4444);
  static const Color taskPostponed = Color(0xFFF59E0B);
}
