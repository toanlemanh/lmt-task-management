import 'package:go_router/go_router.dart';

import '../../features/tasks/view/analysis_task_screen.dart';
import '../../features/tasks/view/editing_task_screen.dart';
import '../../features/tasks/view/home_screen.dart';
import '../../features/tasks/view/new_task_screen.dart';
import '../../features/tasks/view/task_detail_screen.dart';
import '../../main.dart';
import 'app_routes.dart';

final router = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    ShellRoute(
    builder: (context, state, child) {
      return MainScaffold( child: child);
    },
    routes:[
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.add.path,
        name: AppRoutes.add.name,
        builder: (context, state) => NewTaskScreen(),
      ),
      GoRoute(
          path: AppRoutes.analysis.path,
          name: AppRoutes.analysis.name,
          builder: (context, state) => AnalysisTaskScreen()
      ),
      GoRoute(
        path: '${AppRoutes.detail.path}/:id',
        name: AppRoutes.detail.name,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TaskDetailScreen(taskId: id);
        },
      ),
      GoRoute(
        path: '${AppRoutes.edit.path}/:id',
        name: AppRoutes.edit.name,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditingTaskScreen(taskId: id);
        },
      ),
    ])
  ],
);