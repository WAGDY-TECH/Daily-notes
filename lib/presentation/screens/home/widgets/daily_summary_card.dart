import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

/// Card displaying daily summary information
class DailySummaryCard extends StatelessWidget {
  const DailySummaryCard({super.key});

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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const Spacer(),
                Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Mood and energy row
            Row(
              children: [
                _buildMoodItem(Icons.sentiment_very_satisfied, 'Happy', isDark),
                const SizedBox(width: 8),
                _buildMoodItem(Icons.sentiment_neutral, 'Neutral', isDark),
                const SizedBox(width: 8),
                _buildMoodItem(Icons.sentiment_very_dissatisfied, 'Sad', isDark),
                const Spacer(),
                _buildStatItem(Icons.energy_savings, 'Energy: 8/10', isDark),
                const SizedBox(width: 16),
                _buildStatItem(Icons.bedtime, 'Sleep: 7h', isDark),
              ],
            ),
            const SizedBox(height: 12),
            
            // Quick add button
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: AppColors.primary,
              ),
              label: Text(
                'Add Daily Entry',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodItem(IconData icon, String label, bool isDark) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: AppColors.warning,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String text, bool isDark) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.info,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}
