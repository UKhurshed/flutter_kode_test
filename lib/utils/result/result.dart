import 'package:equatable/equatable.dart';

sealed class Result<T> extends Equatable {
  const Result();

  bool get isInitial => this is Initial;

  bool get isLoading => this is Loading;

  bool get isError => this is Error;

  bool get isSuccess => this is Success;

  bool get isTerminal => isSuccess || isError;

  T? get data => isSuccess ? (this as Success<T>).data : null;

  Exception? get exception => isError ? (this as Error).exception : null;
}

class Initial<T> extends Result<T> {
  const Initial();

  @override
  List<Object?> get props => [];
}

class Loading<T> extends Result<T> {
  const Loading();

  @override
  List<Object?> get props => [];
}

class Error<T> extends Result<T> {
  const Error({
    required this.exception,
    this.stackTrace,
  });

  @override
  final Exception exception;

  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [
    exception,
    stackTrace,
  ];
}

class Success<T> extends Result<T> {
  const Success({required this.data});

  @override
  final T data;

  @override
  List<Object?> get props => [data];
}
