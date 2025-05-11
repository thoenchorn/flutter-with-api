import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/home/view/home_page.dart';
import 'package:test_pro/profile/view/profile_page.dart';
import '../navigation/view/navigation_page.dart';

/// The router configuration for the application
final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: NavigationPage.routeName,
      builder: (context, state) => const NavigationPage(),
    ), GoRoute(
      path: ProfilePage.routeName,
      builder: (context, state) => const ProfilePage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Page Not Found')),
    body: Center(
      child: Text('No route defined for ${state.uri.path}'),
    ),
  ),
);