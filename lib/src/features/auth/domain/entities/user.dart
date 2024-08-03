import 'package:equatable/equatable.dart';

import 'address.dart';
import 'company.dart';

/// Represents a user entity in the application.
class User extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String website;
  final Address address;
  final Company company;
  final bool isVerified;
  final String picture;
  final bool isPrivate;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.website,
    required this.address,
    required this.company,
    required this.isVerified,
    required this.picture,
    required this.isPrivate,
  });

  @override
  List<Object> get props => [
        id,
        name,
        username,
        email,
        phoneNumber,
        website,
        address,
        company,
        isVerified,
        picture,
        isPrivate,
      ];

  @override
  bool get stringify => true;
}
