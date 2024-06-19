import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:crypto/crypto.dart';

class RequestSigningInterceptor implements RequestInterceptor {
  RequestSigningInterceptor({
    required String secretKey,
  }) : _secretKey = secretKey;

  final String _secretKey;

  @override
  FutureOr<Request> onRequest(Request request) {
    var requestCopy = request.copyWith();
    final signature = _generateSignature(requestCopy);
    requestCopy = applyHeader(
      requestCopy,
      'Signature',
      signature,
    );
    return requestCopy;
  }

  String _generateSignature(Request request) {
    // Using only body if both body and query params are specified
    final String params =
    request.body != null ? json.encode(request.body) : request.uri.query;
    final currentMinute = DateTime.timestamp().minute;
    final path = request.uri.path;
    final signature = '$params$currentMinute$path';

    return _encodeSignature(signature);
  }

  String _encodeSignature(String signature) {
    final bytes = utf8.encode(signature);
    final key = utf8.encode(_secretKey);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);

    final base64mac = base64.encode(digest.bytes);
    return base64mac;
  }
}
