import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

/// Section displaying recent items
class RecentItems extends StatelessWidget {
  final bool isArabic;
  final bool isDark;

  const RecentItems({super.key, required this.isArabic, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isArabic ? 'الأخرى' : 'Recent',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                isArabic ? 'عرض الكل' : 'View All',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Recent Work Orders
        _buildSection(
          isArabic ? 'أوامر العمل الأخيرة' : 'Recent Work Orders',
          [
            _buildRecentItem(
              Icons.assignment,
              isArabic ? 'صيانة جهاز الأشعة' : 'X-Ray Maintenance',
              isArabic ? 'في تقدم' : 'In Progress',
              AppColors.statusInProgress,
              isDark,
            ),
            _buildRecentItem(
              Icons.assignment,
              isArabic ? 'صيانة جهاز المختبر' : 'Lab Equipment Maintenance',
              isArabic ? 'مخصص' : 'Assigned',
              AppColors.statusAssigned,
              isDark,
            ),
          ],
          isDark,
        ),
        const SizedBox(height: 12),
        
        // Recent Notes
        _buildSection(
          isArabic ? 'الملاحظات الأخيرة' : 'Recent Notes',
          [
            _buildRecentItem(
              Icons.note_alt,
              isArabic ? 'ملاحظة صيانة دورية' : 'Periodic Maintenance Note',
              isArabic ? 'فنية' : 'Technical',
              AppColors.info,
              isDark,
            ),
            _buildRecentItem(
              Icons.note_alt,
              isArabic ? 'تذكرة مهمة' : 'Important Reminder',
              isArabic ? 'عامة' : 'General',
              AppColors.success,
              isDark,
            ),
          ],
          isDark,
        ),
        const SizedBox(height: 12),
        
        // Recent Tasks
        _buildSection(
          isArabic ? 'المهام الأخيرة' : 'Recent Tasks',
          [
            _buildRecentItem(
              Icons.task,
              isArabic ? 'فحص جهاز' : 'Equipment Check',
              isArabic ? 'منته' : 'Completed',
              AppColors.taskCompleted,
              isDark,
            ),
            _buildRecentItem(
              Icons.task,
              isArabic ? 'صيانة دورية' : 'Periodic Maintenance',
              isArabic ? 'في انتظار' : 'Pending',
              AppColors.taskPending,
              isDark,
            ),
          ],
          isDark,
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> items, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildRecentItem(
    IconData icon,
    String title,
    String subtitle,
    Color statusColor,
    bool isDark,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.primary,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: statusColor,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
