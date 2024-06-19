import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

abstract class JsonSerializableConverter extends JsonConverter {
  const JsonSerializableConverter(this.factories);

  final Map<Type, JsonFactory> factories;

  @protected
  T? decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  @protected
  List<T> decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v)).toList();

  @protected
  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) return decodeList<T>(entity as List);

    if (entity is Map) return decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  @override
  // all objects should implements toJson method
  // ignore: unnecessary_overrides
  Request convertRequest(Request request) => super.convertRequest(request);
}
