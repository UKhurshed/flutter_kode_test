import 'dart:async';

import 'package:chopper/chopper.dart';

typedef TokenProvider = Future<String?> Function();

class AuthInterceptor implements RequestInterceptor {
  const AuthInterceptor({
    required TokenProvider accessTokenProvider,
  }) : _accessTokenProvider = accessTokenProvider;

  final TokenProvider _accessTokenProvider;

  @override
  FutureOr<Request> onRequest(Request request) async {
    var requestCopy = request.copyWith();
    final accessToken = await _accessTokenProvider();
    if (accessToken?.isNotEmpty == true) {
      requestCopy = applyHeader(
        requestCopy,
        'Authorization',
        'Bearer $accessToken',
      );
    }
    return requestCopy;
  }
}
