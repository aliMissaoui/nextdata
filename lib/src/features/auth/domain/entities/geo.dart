import 'package:equatable/equatable.dart';

/// Represents geographical coordinates.
class Geo extends Equatable {
  final String lat;
  final String lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props => [lat, lng];

  @override
  bool get stringify => true;
}
