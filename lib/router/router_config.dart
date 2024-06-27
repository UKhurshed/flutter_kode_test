import 'package:chucker_flutter/chucker_flutter.dart';
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
  routes: $appRoutes, //$appRoutes,
);
