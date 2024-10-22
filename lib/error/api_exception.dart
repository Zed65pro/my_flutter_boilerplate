class ApiException implements Exception {
  final String message;
  final dynamic data;

  ApiException(this.message, this.data);

  @override
  String toString() => 'ApiException: $message';
}

class BadRequestException extends ApiException {
  BadRequestException(super.message, super.data);

  @override
  String toString() => 'BadRequestException: $message';
}


class UpgradeRequiredException extends ApiException {
  UpgradeRequiredException(super.message, super.data);

  @override
  String toString() => 'BadRequestException: $message';
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message, super.data);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException extends ApiException {
  ForbiddenException(super.message, super.data);

  @override
  String toString() => 'ForbiddenException: $message';
}

class NotFoundException extends ApiException {
  NotFoundException(super.message, super.data);

  @override
  String toString() => 'NotFoundException: $message';
}

class TooManyRequestsException extends ApiException {
  TooManyRequestsException(super.message, super.data);

  @override
  String toString() => 'TooManyRequestsException: $message';
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.message, super.data);

  @override
  String toString() => 'InternalServerErrorException: $message';
}

class TimeoutException extends ApiException {
  TimeoutException(super.message, super.data);

  @override
  String toString() => 'TimeoutException: $message';
}

class NetworkException extends ApiException {
  NetworkException(super.message, super.data);

  @override
  String toString() => 'NetworkException: $message';
}

class ValidationException extends ApiException {
  ValidationException(super.message, super.data);

  @override
  String toString() => 'Validation Exception: $message';
}
