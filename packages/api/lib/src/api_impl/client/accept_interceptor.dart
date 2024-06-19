import 'dart:async';

import 'package:chopper/chopper.dart';

class AcceptInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    return applyHeader(request, 'Accept', 'application/json');
  }
}