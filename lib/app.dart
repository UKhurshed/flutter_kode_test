import 'package:api/api.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kode_test/screens/employees/view/employees_page.dart';
import 'package:flutter_kode_test/utils/s.dart';
import 'package:repository/repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final apiClient = ApiClient(
      isRelease: kReleaseMode,
      baseUrl: null,
      interceptors: [
        if (!kReleaseMode) ChuckerChopperInterceptor(),
      ],
      accessTokenProvider: () async {
        return "";
      });

  late final userRepository =
      UsersRepositoryImpl(usersService: apiClient.getService());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UsersRepository>.value(value: userRepository)
      ],
      child: MaterialApp(
        localizationsDelegates: S.delegates,
        supportedLocales: S.locales,
        home: const EmployeesPage(),
      ),
    );
  }
}
