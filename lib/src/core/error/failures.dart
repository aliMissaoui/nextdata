import 'package:equatable/equatable.dart';

/// Base class for representing failures in the application.
///
/// All specific failure types should extend this class.
abstract class Failure extends Equatable {
  /// The message describing the failure.
  final String message;

  /// Constructs a [Failure] with a given message.
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Server-Related Failures

/// Represents a server-related failure.
///
/// This could be a generic server error.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with an optional message.
  ///
  /// Defaults to 'Server error' if no message is provided.
  const ServerFailure([super.message = 'Server error']);
}

/// Represents an unauthorized access failure.
///
/// This could occur when authentication is required but not provided.
class UnauthorizedFailure extends Failure {
  /// Constructs an [UnauthorizedFailure] with an optional message.
  ///
  /// Defaults to 'Unauthorized' if no message is provided.
  const UnauthorizedFailure([super.message = 'Unauthorized']);
}

/// Represents a resource not found failure.
///
/// This could occur when the requested resource is not available on the server.
class ResourceNotFoundFailure extends Failure {
  /// Constructs a [ResourceNotFoundFailure] with an optional message.
  ///
  /// Defaults to 'Not found' if no message is provided.
  const ResourceNotFoundFailure([super.message = 'Not found']);
}

// Network Failures

/// Represents a generic network failure.
///
/// This could be due to various network-related issues.
class NetworkFailure extends Failure {
  /// Constructs a [NetworkFailure] with an optional message.
  ///
  /// Defaults to 'Network error' if no message is provided.
  const NetworkFailure([super.message = 'Network error']);
}

/// Represents a failure due to no internet connection.
///
/// This could occur when the device is not connected to any network.
class NoInternetConnectionFailure extends Failure {
  /// Constructs a [NoInternetConnectionFailure] with an optional message.
  ///
  /// Defaults to 'No internet connection' if no message is provided.
  const NoInternetConnectionFailure([super.message = 'No internet connection']);
}

/// Represents a failure due to a request timeout.
///
/// This could occur when a network request takes too long to complete.
class TimeoutFailure extends Failure {
  /// Constructs a [TimeoutFailure] with an optional message.
  ///
  /// Defaults to 'Request timeout' if no message is provided.
  const TimeoutFailure([super.message = 'Request timeout']);
}

// Cache Failures

/// Represents a generic cache failure.
///
/// This could be due to various issues related to caching.
class CacheFailure extends Failure {
  /// Constructs a [CacheFailure] with an optional message.
  ///
  /// Defaults to 'Cache error' if no message is provided.
  const CacheFailure([super.message = 'Cache error']);
}

/// Represents a cache miss failure.
///
/// This could occur when the requested data is not found in the cache.
class CacheMissFailure extends Failure {
  /// Constructs a [CacheMissFailure] with an optional message.
  ///
  /// Defaults to 'Cache miss' if no message is provided.
  const CacheMissFailure([super.message = 'Cache miss']);
}
