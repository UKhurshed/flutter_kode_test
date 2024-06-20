import 'package:flutter_kode_test/utils/result/result.dart';

typedef Emitter<T extends Result<V>, V> = void Function(T value);

Future<void> produceResult<T>({
  required Future<T> Function() callback,
  required Emitter<Result<T>, T> emitter,
  Emitter<Success<T>, T>? successEmitter,
  Emitter<Error<T>, T>? errorEmitter,
  Emitter<Loading<T>, T>? loadingEmitter,
}) async {
  _emit(Loading<T>(), loadingEmitter, emitter);
  try {
    final data = await callback();
    _emit(Success(data: data), successEmitter, emitter);
  } on Exception catch (e) {
    _emit(Error<T>(exception: e), errorEmitter, emitter);
  }
}

void _emit<T extends Result<V>, V>(
    T value,
    Emitter<T, V>? specializedEmitter,
    Emitter<T, V> defaultEmitter,
    ) {
  if (specializedEmitter != null) {
    specializedEmitter(value);
  } else {
    defaultEmitter(value);
  }
}