abstract class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);

  @override
  String toString() => message;
}

class NoInternetException extends NetworkException {
  const NoInternetException() : super('No internet connection');
}

class ApiException extends NetworkException {
  final int statusCode;
  const ApiException(super.message, this.statusCode);
}

class TimeoutException extends NetworkException {
  const TimeoutException() : super('Request timed out');
}

class InvalidResponseException extends NetworkException {
  const InvalidResponseException() : super('Invalid server response');
}
