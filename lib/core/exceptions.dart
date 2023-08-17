class APIException implements Exception {
  final Map<String, dynamic> details;

  APIException(this.details);
}

class InvalidUserException implements Exception {}

class InvalidParameter implements Exception {
  final String message;

  InvalidParameter(this.message);
}

class NoConnectionException implements Exception {
  @override
  String toString() => 'No connection';
}
