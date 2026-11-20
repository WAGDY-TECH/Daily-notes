import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/splash/splash_screen.dart';
import '../presentation/screens/home/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String workOrders = '/work-orders';
  static const String notes = '/notes';
  static const String tasks = '/tasks';
  static const String memories = '/memories';
  static const String search = '/search';
  static const String settings = '/settings';
  
  static final router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'work-orders',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: 'notes',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: 'tasks',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: 'memories',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: 'search',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.location}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
