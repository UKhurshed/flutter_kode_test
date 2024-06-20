import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_kode_test/screens/employees/view/employees_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import 'app_routes.dart';

final config = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/main',
    debugLogDiagnostics: !kReleaseMode,
    observers: [
      ChuckerFlutter.navigatorObserver,
    ],
    routes: <RouteBase>[
      GoRoute(
          path: '/main',
          name: EmployeesPage.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const EmployeesPage();
          })
    ] //$appRoutes,
    );
