import 'package:nextdata/src/core/error/failures.dart';
import 'package:nextdata/src/core/error/result.dart';
import 'package:nextdata/src/core/network/network_info.dart';
import 'package:nextdata/src/features/home/domain/entities/post.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/posts_remote_data_source.dart';
import 'posts_repository.dart';

/// Implementation of [PostRepository] that interacts with remote data source and network info.
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  /// Fetches a list of posts.
  /// Returns a [Result] wrapping a list of [Post] on success or a [ServerFailure] on failure.
  @override
  Future<Result<List<Post>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPosts();
        return Result.success(remotePosts);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      try {
        final cachedPosts = await remoteDataSource.getCachedPosts();
        if (cachedPosts != null) {
          return Result.success(cachedPosts);
        } else {
          return Result.failure(const CacheFailure());
        }
      } on CacheException {
        return Result.failure(const CacheFailure());
      }
    }
  }

  /// Fetches a single post by its ID.
  /// Returns a [Result] wrapping a [Post] on success or a [ServerFailure] on failure.
  @override
  Future<Result<Post>> getPostById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePost = await remoteDataSource.getPostById(id);
        return Result.success(remotePost);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      try {
        final cachedPost = await remoteDataSource.getCachedPostById(id);
        if (cachedPost != null) {
          return Result.success(cachedPost);
        } else {
          return Result.failure(const CacheFailure());
        }
      } on CacheException {
        return Result.failure(const CacheFailure());
      }
    }
  }
}
