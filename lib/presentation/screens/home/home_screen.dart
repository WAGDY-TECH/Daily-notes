import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/colors.dart';
import '../../providers/theme_provider.dart';
import '../../providers/language_provider.dart';
import '../../widgets/common/app_drawer.dart';
import 'widgets/daily_summary_card.dart';
import 'widgets/quick_access_grid.dart';
import 'widgets/recent_items.dart';

/// Home screen displaying dashboard with daily summary and quick access
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    final isDark = themeState.mode == ThemeMode.dark;
    final isArabic = languageState.isArabic;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          isArabic ? 'الرئيسية' : 'Home',
          style: TextStyle(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            onPressed: () => context.go('/home/search'),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Daily Summary Card
              const DailySummaryCard(),
              const SizedBox(height: 16),
              
              // Quick Access Grid
              QuickAccessGrid(isArabic: isArabic),
              const SizedBox(height: 16),
              
              // Recent Items
              RecentItems(isArabic: isArabic, isDark: isDark),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          // Navigate to different sections
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/home/memories');
              break;
            case 2:
              context.go('/home/tasks');
              break;
            case 3:
              context.go('/home/search');
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.note_alt_outlined),
            activeIcon: const Icon(Icons.note_alt),
            label: isArabic ? 'يومياتي' : 'Notes',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book_outlined),
            activeIcon: const Icon(Icons.book),
            label: isArabic ? 'ذكرياتي' : 'Memories',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task_outlined),
            activeIcon: const Icon(Icons.task),
            label: isArabic ? 'المهام' : 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
            label: isArabic ? 'البحث' : 'Search',
          ),
        ],
        selectedItemColor: AppColors.primary,
        unselectedItemColor: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        onPressed: () {
          // Show bottom sheet for quick actions
          _showQuickActions(context, isArabic, isDark);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showQuickActions(BuildContext context, bool isArabic, bool isDark) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isArabic ? 'إضافة جديد' : 'Add New',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.note_add_outlined,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              title: Text(
                isArabic ? 'ملاحظة جديدة' : 'New Note',
                style: TextStyle(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/notes/create');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.task_outlined,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              title: Text(
                isArabic ? 'مهمة جديدة' : 'New Task',
                style: TextStyle(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/tasks/create');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book_outlined,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              title: Text(
                isArabic ? 'ذكرى جديدة' : 'New Memory',
                style: TextStyle(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/memories/create');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.assignment_outlined,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              title: Text(
                isArabic ? 'أمر عمل جديد' : 'New Work Order',
                style: TextStyle(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/work-orders/create');
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
