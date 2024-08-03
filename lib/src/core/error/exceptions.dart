/// Base class for app-specific exceptions
class AppException implements Exception {
  /// The error message associated with the exception
  final String message;

  /// An optional prefix to categorize the exception
  final String? prefix;

  /// Constructor for [AppException]
  ///
  /// [message] is the error message.
  /// [prefix] is an optional prefix for categorization.
  AppException([this.message = '', this.prefix]);
}

// Server-Related Exceptions

/// Exception for server-related errors
class ServerException extends AppException {
  /// Constructor for [ServerException]
  ///
  /// [message] is the error message, with a default value of an empty string.
  ServerException([String message = ''])
      : super(message, 'Server'); // Prefix for server errors
}

/// Exception for unauthorized access errors
class UnauthorizedException extends ServerException {
  /// Constructor for [UnauthorizedException]
  ///
  /// [message] is the error message, with a default value of 'Unauthorized'.
  UnauthorizedException([super.message = 'Unauthorized']);
}

/// Exception for resource not found errors
class ResourceNotFoundException extends ServerException {
  /// Constructor for [ResourceNotFoundException]
  ///
  /// [message] is the error message, with a default value of 'Not found'.
  ResourceNotFoundException([super.message = 'Not found']);
}

// Network Exceptions

/// Exception for network-related errors
class NetworkException extends AppException {
  /// Constructor for [NetworkException]
  ///
  /// [message] is the error message, with a default value of an empty string.
  NetworkException([String message = '']) : super(message, 'Network');
}

/// Exception for no internet connection errors
class NoInternetConnectionException extends NetworkException {
  /// Constructor for [NoInternetConnectionException]
  ///
  /// [message] is the error message, with a default value of 'No internet connection'.
  NoInternetConnectionException([super.message = 'No internet connection']);
}

/// Exception for request timeout errors
class TimeoutException extends NetworkException {
  /// Constructor for [TimeoutException]
  ///
  /// [message] is the error message, with a default value of 'Request timeout'.
  TimeoutException([super.message = 'Request timeout']);
}

// Cache Exceptions

/// Exception for cache-related errors
class CacheException extends AppException {
  /// Constructor for [CacheException]
  ///
  /// [message] is the error message, with a default value of an empty string.
  CacheException([String message = '']) : super(message, 'Cache');
}

/// Exception for cache miss errors
class CacheMissException extends CacheException {
  /// Constructor for [CacheMissException]
  ///
  /// [message] is the error message, with a default value of 'Cache miss'.
  CacheMissException([super.message = 'Cache miss']);
}
