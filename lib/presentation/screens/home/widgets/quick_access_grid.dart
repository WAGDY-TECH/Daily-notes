import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

/// Grid of quick access buttons
class QuickAccessGrid extends StatelessWidget {
  final bool isArabic;

  const QuickAccessGrid({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isArabic ? 'الوصول السريع' : 'Quick Access',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildQuickAccessItem(
                  Icons.assignment_outlined,
                  isArabic ? 'أوامر العمل' : 'Work Orders',
                  AppColors.info,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.note_alt_outlined,
                  isArabic ? 'ملاحظاتي' : 'My Notes',
                  AppColors.success,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.task_outlined,
                  isArabic ? 'المهام' : 'Tasks',
                  AppColors.warning,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.book_outlined,
                  isArabic ? 'ذكرياتي' : 'Memories',
                  AppColors.error,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.calendar_today,
                  isArabic ? 'اليوميات' : 'Daily',
                  AppColors.primary,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.people_outline,
                  isArabic ? 'الفنيين' : 'Technicians',
                  AppColors.info,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.business_outlined,
                  isArabic ? 'الأقسام' : 'Departments',
                  AppColors.success,
                  isDark,
                  () {},
                ),
                _buildQuickAccessItem(
                  Icons.build_outlined,
                  isArabic ? 'المعدات' : 'Equipment',
                  AppColors.warning,
                  isDark,
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessItem(
    IconData icon,
    String label,
    Color color,
    bool isDark,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
