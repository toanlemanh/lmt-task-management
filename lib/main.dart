import 'package:flutter/material.dart';
import 'package:flutter_project/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

import 'core/routing/router_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}

class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({required this.child, super.key});

  int _getIndex(BuildContext context) {
    // final GoRouter route = GoRouter.of(context);
    // final String location = route.location;

   final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.home.path)) {
      return 0;
    }
    if (location.startsWith(AppRoutes.add.path)) {
      return 1;
    }
    if (location.startsWith(AppRoutes.analysis.path)) {
      return 2;
    }
    if (location.startsWith(AppRoutes.edit.path)) {
    return 3;
    }
    if (location.startsWith(AppRoutes.detail.path)) {
      return 4;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    final destinations = [
      AppRoutes.home.path,
      AppRoutes.add.path,
      AppRoutes.analysis.path,
      '${AppRoutes.edit.path}/:id',
      '${AppRoutes.detail.path}/:id',
    ];
    context.go(destinations[index]);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndex(context);

    return SafeArea(
      child: Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      )
    );
  }
}
