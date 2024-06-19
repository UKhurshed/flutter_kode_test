class DataSourceException implements Exception {
  const DataSourceException({
    required this.message,
  });

  final String message;

  @override
  String toString() {
    return 'DataSourceException(message: $message)';
  }
}