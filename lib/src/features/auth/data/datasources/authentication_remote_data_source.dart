import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextdata/src/core/error/exceptions.dart';
import 'package:nextdata/src/features/auth/data/models/user_model.dart';

import '../../domain/entities/address.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/geo.dart';

/// Abstract class defining the contract for authentication-related remote data operations.
abstract class AuthRemoteDataSource {
  /// Logs in a user with the provided [email] and [password].
  ///
  /// Returns a [UserModel] if successful.
  /// Throws a [ServerException] or catched [DioException] for any error response.
  Future<UserModel> login(String email, String password);

  /// Registers a user with the provided [phoneNumber], [email], [password], and [verifyPassword].
  ///
  /// Returns a [UserModel] if successful.
  /// Throws a [ServerException] or catched [DioException] for any error response.
  Future<UserModel> register(
      String phoneNumber, String email, String password, String verifyPassword);

  Future<dynamic> refreshAccessToken();
}

/// Implementation of [AuthRemoteDataSource] that uses [Dio] for HTTP requests.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  final FirebaseAuth firebaseAuth;

  /// Creates an instance of [AuthRemoteDataSourceImpl] with the given [dio] instance.
  AuthRemoteDataSourceImpl({
    required this.dio,
    required this.firebaseAuth,
  });

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        String? idToken = await firebaseUser.getIdToken();
        String? refreshToken = firebaseUser.refreshToken;
        await storage.write(key: 'accessToken', value: idToken);
        await storage.write(key: 'refreshToken', value: refreshToken);

        UserModel userModel = UserModel(
          id: firebaseUser.uid,
          name: '',
          username: '',
          email: firebaseUser.email ?? '',
          phoneNumber: firebaseUser.phoneNumber ?? '',
          website: '',
          address: const Address(
            street: '',
            suite: '',
            city: '',
            zipcode: '',
            geo: Geo(lat: '', lng: ''),
          ),
          company: const Company(
            name: '',
            catchPhrase: '',
            bs: '',
          ),
          isVerified: firebaseUser.emailVerified,
          picture: firebaseUser.photoURL ?? '',
          isPrivate: false,
        );

        return userModel;
      } else {
        throw ServerException();
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> register(String phoneNumber, String email, String password,
      String verifyPassword) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // Create a UserModel from Firebase User
        UserModel userModel = UserModel(
          id: firebaseUser.uid,
          name: '',
          username: '',
          email: firebaseUser.email ?? '',
          phoneNumber: phoneNumber,
          website: '',
          address: const Address(
            street: '',
            suite: '',
            city: '',
            zipcode: '',
            geo: Geo(lat: '', lng: ''),
          ),
          company: const Company(
            name: '',
            catchPhrase: '',
            bs: '',
          ),
          isVerified: firebaseUser.emailVerified,
          picture: firebaseUser.photoURL ?? '',
          isPrivate: false,
        );

        return userModel;
      } else {
        throw ServerException();
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> refreshAccessToken() async {
    final refreshToken = await storage.read(key: 'refreshToken');
    if (refreshToken != null) {
      try {
        final response = await dio.post(
          'https://example-to-be-changed-later/auth/refreshToken',
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200) {
          await storage.write(
              key: 'accessToken', value: response.data['data']['accessToken']);
          await storage.write(
              key: 'refreshToken',
              value: response.data['data']['refreshToken']);
          return response.data['data']['accessToken'];
        } else {
          throw ServerException();
        }
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
