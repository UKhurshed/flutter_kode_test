class UnsuccessfulResponseException implements Exception {
  UnsuccessfulResponseException({
    required this.code,
    required this.key,
  });

  final int code;
  final String key;

  @override
  String toString() => 'API error. Status: $code\n$key';
}
