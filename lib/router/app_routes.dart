import 'package:flutter/material.dart';
import 'package:flutter_kode_test/screens/detail_employee_info/view/detail_employee_info_page.dart';
import 'package:flutter_kode_test/screens/employees/view/employees_page.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<MainRoute>(
  path: '/main',
  name: EmployeesPage.routeName,
  routes: [
    TypedGoRoute<DetailEmployeeInfoRoute>(
      path: 'detail_employee_info',
      name: DetailEmployeeInfoPage.routeName,
    ),
  ],
)
@immutable
class MainRoute extends GoRouteData {
  const MainRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmployeesPage();
  }
}

@immutable
class DetailEmployeeInfoRoute extends GoRouteData {
  const DetailEmployeeInfoRoute({
    required this.avatarUrl,
    required this.fullName,
    required this.position,
    required this.birthday,
    required this.phone,
  });

  final String avatarUrl;
  final String fullName;
  final String position;
  final String birthday;
  final String phone;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailEmployeeInfoPage(
      avatarUrl: avatarUrl,
      fullName: fullName,
      position: position,
      phone: phone,
      birthday: birthday,
    );
  }
}
