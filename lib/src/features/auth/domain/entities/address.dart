import 'package:equatable/equatable.dart';

import 'geo.dart';

/// Represents an address entity in the application.
class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];

  @override
  bool get stringify => true;
}
