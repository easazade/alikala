abstract class AppException implements Exception {
  bool isReported = false;
  bool shouldBeReported = true;
}

class DoNotCallException extends AppException {
  final String methodName;

  DoNotCallException([this.methodName = ""]);

  @override
  bool get shouldBeReported => false;

  @override
  String toString() => 'Error - This method should never be called, $methodName';
}
