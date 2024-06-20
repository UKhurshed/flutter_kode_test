

import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocBaseExtensions<T> on BlocBase<T> {

  void safelyEmit(T state) {
    if (!isClosed) {
      emit(state);
    }
  }
}