import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Abstract class representing network information.
///
/// This class defines a contract for checking network connectivity status.
/// Implementations of this class should provide a way to check if the device is connected to the internet.
abstract class NetworkInfo {
  /// A [Future] that resolves to `true` if the device is connected to the internet, `false` otherwise.
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo] that uses [InternetConnectionChecker] to check network connectivity.
class NetworkInfoImpl implements NetworkInfo {
  /// The [InternetConnectionChecker] instance used to check network connectivity.
  final InternetConnectionChecker connectionChecker;

  /// Creates a new instance of [NetworkInfoImpl] with the given [InternetConnectionChecker].
  ///
  /// The [connectionChecker] parameter must not be null.
  NetworkInfoImpl(this.connectionChecker);

  /// A [Future] that resolves to `true` if the device is connected to the internet, `false` otherwise.
  ///
  /// This implementation uses the [InternetConnectionChecker.hasConnection] to check the network status.
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
