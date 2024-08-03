import 'package:nextdata/src/features/auth/domain/entities/user.dart';

import '../../domain/entities/address.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/geo.dart';

/// UserModel class extends User entity to represent a user with additional data handling capabilities.
class UserModel extends User {
  /// Default constructor for UserModel.
  /// Inherits properties from User entity.
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phoneNumber,
    required super.website,
    required super.address,
    required super.company,
    required super.isVerified,
    required super.picture,
    required super.isPrivate,
  });

  /// Factory method to create a UserModel instance from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone'],
      website: json['website'],
      address: Address(
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
        geo: Geo(
          lat: json['address']['geo']['lat'],
          lng: json['address']['geo']['lng'],
        ),
      ),
      company: Company(
        name: json['company']['name'],
        catchPhrase: json['company']['catchPhrase'],
        bs: json['company']['bs'],
      ),
      isVerified: json['isVerified'] ?? false,
      picture: json['picture'] ?? '',
      isPrivate: json['isPrivate'] ?? false,
    );
  }

  /// Converts the UserModel instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phoneNumber,
      'website': website,
      'address': {
        'street': address.street,
        'suite': address.suite,
        'city': address.city,
        'zipcode': address.zipcode,
        'geo': {
          'lat': address.geo.lat,
          'lng': address.geo.lng,
        },
      },
      'company': {
        'name': company.name,
        'catchPhrase': company.catchPhrase,
        'bs': company.bs,
      },
      'isVerified': isVerified,
      'picture': picture,
      'isPrivate': isPrivate,
    };
  }
}
