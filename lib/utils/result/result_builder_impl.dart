import 'package:flutter/material.dart';
import 'package:flutter_kode_test/utils/result/default_error_view.dart';
import 'package:flutter_kode_test/utils/result/result_builder.dart';

class ResultBuilderImpl<T> extends ResultBuilder<T> {
  const ResultBuilderImpl({
    super.key,
    required super.result,
    required super.successBuilder,
    super.loadingBuilder,
    super.errorBuilder,
    super.initialBuilder,
    super.emptyBuilder,
    this.retryCallback,
  });

  final VoidCallback? retryCallback;

  @override
  Widget defaultErrorBuilder(
    BuildContext context,
    Exception exception,
    StackTrace? stackTrace,
  ) {
    return Center(
      child: DefaultErrorView(exception: exception),
    );
  }

  @override
  Widget defaultLoadingBuilder(BuildContext context) {
    return const Center(
      child: DefaultLoadingView(),
    );
  }
}

class DefaultLoadingView extends StatelessWidget {
  const DefaultLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
