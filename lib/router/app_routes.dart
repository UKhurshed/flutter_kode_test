import 'package:flutter/material.dart';
import 'package:flutter_kode_test/screens/employees/view/employees_page.dart';
import 'package:go_router/go_router.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<MainRoute>(
  path: '/main',
  name: EmployeesPage.routeName,
)
class MainRoute extends GoRouteData {
  const MainRoute();

  static const String $restorationScopeId = "shellRestorationScopeId";
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmployeesPage();
  }
}
