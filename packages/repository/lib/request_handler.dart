import 'package:api/api.dart';
import 'package:chopper/chopper.dart';
import 'package:domain/domain.dart';

typedef Request<T> = Future<Response<T>> Function();

typedef Mapper<S, T> = T Function(S input);

typedef ErrorMapper = Mapper<Object?, DataSourceException>;

final class RequestHandler {
  const RequestHandler._();

  static DataSourceException _defaultErrorMapper(Object? input) {
    return DataSourceException(
      message: (input as CommonErrorResponse?)?.message ?? '',
    );
  }

  static ErrorMapper errorMapper = _defaultErrorMapper;
}

Future<T> handleRequest<S, T>(
    Request<S> callback,
    Mapper<S, T> mapper, {
      ErrorMapper? errorMapper,
    }) async {
  final response = await callback();
  if (response.isSuccessful) {
    return mapper(response.body as S);
  }

  final effectiveErrorMapper = errorMapper ?? RequestHandler.errorMapper;
  throw effectiveErrorMapper(response.error);
}
