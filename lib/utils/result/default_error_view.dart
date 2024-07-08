import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DefaultErrorView extends StatelessWidget {
  const DefaultErrorView({
    super.key,
    required this.exception,
  });

  final Exception? exception;

  @override
  Widget build(BuildContext context) {

    //TODO add localizable error message
    final error = switch (exception) {
      SocketException() => const UiError(
        title: "s.connectionErrorTitle",
        description: "s.connectionErrorDescription",
      ),
      _ => const UiError(
        title: "s.genericErrorTitle",
        description: "s.genericErrorDescription",
      ),
    };

    return ErrorView(error: error);
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
  });

  final UiError error;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (error.image != null) ...[
          error.image!,
          const SizedBox(height: 24.0),
        ],
        if (error.title != null) ...[
          Text(
            error.title!,
            style: textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
        ],
        if (error.description != null) ...[
          Text(
            error.description!,
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
        ],
        if (error.buttonConfig != null) ...[
          FilledButton(
            onPressed: error.buttonConfig!.onPressed,
            child: Text(error.buttonConfig!.label),
          ),
        ],
      ],
    );
  }
}

class UiError extends Equatable {
  const UiError({
    this.title,
    this.description,
    this.image,
    this.buttonConfig,
  }) : assert(title != null || description != null);

  final String? title;
  final String? description;
  final Widget? image;
  final UiErrorButtonConfig? buttonConfig;

  @override
  List<Object?> get props => [
    title,
    description,
    image,
  ];
}

class UiErrorButtonConfig extends Equatable {
  const UiErrorButtonConfig({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  List<Object?> get props => [
    label,
    onPressed,
  ];
}
