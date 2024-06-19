import 'dart:io';

import 'package:api/api.dart';
import 'package:api/src/api_impl/client/accept_interceptor.dart';
import 'package:api/src/api_impl/client/services.dart';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;

import 'factories.dart';

const _noProxy = 'DIRECT';

class ApiClient {
  ApiClient({
    required bool isRelease,
    required String? baseUrl,
    required TokenProvider accessTokenProvider,
    Iterable<dynamic> interceptors = const [],
    List<ChopperService> extraServices = const [],
    Map<Type, JsonFactory> extraFactories = const {},
  }) {
    final converter = DefaultConverter({...factories, ...extraFactories});

    final ioc = HttpClient();
    if (!isRelease) {
      ioc.badCertificateCallback = (cert, host, port) => true;
    }
    final client = http.IOClient(ioc);

    _chopperClient = ChopperClient(
      client: client,
      baseUrl: Uri.parse(
        isRelease ? ApiClient.baseUrl.prod : baseUrl ?? ApiClient.baseUrl.prod,
      ),
      converter: converter,
      errorConverter: converter,
      services: services + extraServices,
      interceptors: [
        AcceptInterceptor(),
        AuthInterceptor(
          accessTokenProvider: accessTokenProvider,
        ),
        ...interceptors,
        HttpLoggingInterceptor(),
      ],
    );
  }

  static const baseUrl = BaseUrl._(
    test: 'https://stoplight.io/mocks/kode-api/trainee-test/331141861',
    prod: 'https://stoplight.io/mocks/kode-api/trainee-test/331141861',
  );

  late final ChopperClient _chopperClient;

  T getService<T extends ChopperService>() => _chopperClient.getService<T>();
}

class BaseUrl {
  const BaseUrl._({
    required this.test,
    required this.prod,
  });

  final String test;
  final String prod;
}
