
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:api/src/models/common/common.dart';

import 'json_serializable_converter.dart';

class DefaultConverter extends JsonSerializableConverter {
  const DefaultConverter(super.factories);

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response,
      ) async {
    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(body: decode<Item>(jsonRes.body));
  }

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response response) async {
    final jsonRes = await super.convertError(response);
    final error = decode<CommonErrorResponse>(jsonRes.body);
    return jsonRes.copyWith(bodyError: error);
  }
}
