import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/colors.dart';
import '../../providers/theme_provider.dart';
import '../../providers/language_provider.dart';

/// Application drawer for navigation
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    final isDark = themeState.mode == ThemeMode.dark;
    final isArabic = languageState.isArabic;

    return Drawer(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  isArabic ? 'مرحبا بكم' : 'Welcome',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  isArabic ? 'نظام يوميات المستشفى' : 'Hospital Daily Notes',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          
          // Hospital Work section
          ListTile(
            leading: Icon(
              Icons.work_outline,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            title: Text(
              isArabic ? 'شغل المستشفى' : 'Hospital Work',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {},
          ),
          
          // Work Orders
          ListTile(
            leading: Icon(
              Icons.assignment_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'أوامر العمل' : 'Work Orders',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/work-orders');
            },
          ),
          
          // Equipment
          ListTile(
            leading: Icon(
              Icons.build_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'المعدات' : 'Equipment',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/equipment');
            },
          ),
          
          // Technicians
          ListTile(
            leading: Icon(
              Icons.people_outline,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'الفنيين' : 'Technicians',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/technicians');
            },
          ),
          
          // Departments
          ListTile(
            leading: Icon(
              Icons.business_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'الأقسام' : 'Departments',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/departments');
            },
          ),
          
          // Checklists
          ListTile(
            leading: Icon(
              Icons.checklist_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'قوائم الفحص' : 'Checklists',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/checklists');
            },
          ),
          
          const Divider(),
          
          // Notes section
          ListTile(
            leading: Icon(
              Icons.note_alt_outlined,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            title: Text(
              isArabic ? 'النوتة' : 'Notes',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {},
          ),
          
          // My Notes
          ListTile(
            leading: Icon(
              Icons.sticky_note_2_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'ملاحظاتي' : 'My Notes',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/notes');
            },
          ),
          
          // Daily Entries
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'المدونات اليومية' : 'Daily Entries',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/daily-entries');
            },
          ),
          
          const Divider(),
          
          // Archive section
          ListTile(
            leading: Icon(
              Icons.archive_outlined,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            title: Text(
              isArabic ? 'الأرشيف' : 'Archive',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {},
          ),
          
          const Divider(),
          
          // Settings
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            title: Text(
              isArabic ? 'الإعدادات' : 'Settings',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/home/settings');
            },
          ),
          
          // Theme toggle
          ListTile(
            leading: Icon(
              Icons.brightness_6_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'الوضع الليلي/النهاري' : 'Dark/Light Mode',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            trailing: Switch(
              value: isDark,
              onChanged: (value) {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              activeColor: AppColors.primary,
            ),
            onTap: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          
          // Language toggle
          ListTile(
            leading: Icon(
              Icons.language_outlined,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            title: Text(
              isArabic ? 'اللغة' : 'Language',
              style: TextStyle(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            trailing: Switch(
              value: isArabic,
              onChanged: (value) {
                ref.read(languageProvider.notifier).toggleLanguage();
              },
              activeColor: AppColors.primary,
            ),
            onTap: () {
              ref.read(languageProvider.notifier).toggleLanguage();
            },
          ),
          
          const Divider(),
          
          // Logout
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: AppColors.error,
            ),
            title: Text(
              isArabic ? 'تسجيل الخروج' : 'Logout',
              style: TextStyle(
                color: AppColors.error,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }
}
