// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/main',
      name: 'employee',
      parentNavigatorKey: MainRoute.$parentNavigatorKey,
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'detail_employee_info',
          name: 'detail_employee_info',
          parentNavigatorKey: DetailEmployeeInfoRoute.$parentNavigatorKey,
          factory: $DetailEmployeeInfoRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/main',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DetailEmployeeInfoRouteExtension on DetailEmployeeInfoRoute {
  static DetailEmployeeInfoRoute _fromState(GoRouterState state) =>
      DetailEmployeeInfoRoute(
        avatarUrl: state.uri.queryParameters['avatar-url']!,
        fullName: state.uri.queryParameters['full-name']!,
        position: state.uri.queryParameters['position']!,
        birthday: state.uri.queryParameters['birthday']!,
        phone: state.uri.queryParameters['phone']!,
      );

  String get location => GoRouteData.$location(
        '/main/detail_employee_info',
        queryParams: {
          'avatar-url': avatarUrl,
          'full-name': fullName,
          'position': position,
          'birthday': birthday,
          'phone': phone,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
