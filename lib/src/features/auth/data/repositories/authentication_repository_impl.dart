import 'package:nextdata/src/core/error/failures.dart';
import 'package:nextdata/src/core/error/result.dart';
import 'package:nextdata/src/core/network/network_info.dart';
import 'package:nextdata/src/features/auth/domain/entities/user.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/authentication_remote_data_source.dart';
import 'authentication_repository.dart';

/// Implementation of [AuthRepository] that interacts with remote data source and network info.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  /// Attempts to authenticate the user with the provided [email] and [password].
  /// Returns a [Result] wrapping a [User] entity on success or a [ServerFailure] on failure.
  @override
  Future<Result<User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.login(email, password);
        return Result.success(remoteUser);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      return Result.failure(const ServerFailure());
    }
  }

  /// Registers a new user with the provided [phoneNumber], [email], [password], and [verifyPassword].
  /// Returns a [Result] wrapping a [User] entity on success or a [ServerFailure] on failure.
  @override
  Future<Result<User>> register(
    String phoneNumber,
    String email,
    String password,
    String verifyPassword,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.register(
          phoneNumber,
          email,
          password,
          verifyPassword,
        );
        return Result.success(remoteUser);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      return Result.failure(const ServerFailure());
    }
  }

  /// Refresh the access token of the user.
  /// Returns a [Result] wrapping a [String] on success or a [ServerFailure] on failure.
  @override
  Future<Result<String?>> refreshAccessToken() async {
    if (await networkInfo.isConnected) {
      try {
        final refreshAccess = await remoteDataSource.refreshAccessToken();
        return Result.success(refreshAccess);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      return Result.failure(const ServerFailure());
    }
  }
}
