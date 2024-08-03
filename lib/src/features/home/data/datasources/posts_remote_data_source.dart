import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextdata/src/features/home/data/models/post_model.dart';

/// Abstract class defining the contract for the Post remote data source.
abstract class PostRemoteDataSource {
  /// Fetches a list of posts from the remote data source.
  Future<List<PostModel>> getPosts();

  /// Fetches a single post by its ID from the remote data source.
  Future<PostModel?> getPostById(int id);

  /// Fetches the list of cached posts from secure storage.
  Future<List<PostModel>?> getCachedPosts();

  /// Fetches a single cached post by its ID from secure storage.
  Future<PostModel?> getCachedPostById(int id);
}

/// Implementation of [PostRemoteDataSource] using Dio for HTTP requests
/// and flutter_secure_storage for secure local storage.
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  /// Key for storing posts in secure storage.
  static const String _postsKey = 'POSTS';

  PostRemoteDataSourceImpl({required this.dio, required this.secureStorage});

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final posts = data.map((post) => PostModel.fromJson(post)).toList();

        // Save posts to secure storage
        await _savePostsToSecureStorage(posts);

        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      // Handle errors, possibly by fetching from local storage if available
      final cachedPosts = await _getPostsFromSecureStorage();
      if (cachedPosts != null) {
        return cachedPosts;
      }
      rethrow;
    }
  }

  @override
  Future<PostModel?> getPostById(int id) async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts/$id');

      if (response.statusCode == 200) {
        final data = response.data;
        final post = PostModel.fromJson(data);

        // Save post to secure storage
        await _savePostToSecureStorage(post);

        return post;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      // Handle errors, possibly by fetching from local storage if available
      final cachedPost = await _getPostFromSecureStorageById(id);
      if (cachedPost != null) {
        return cachedPost;
      }
      rethrow;
    }
  }

  /// Saves the list of [PostModel] to secure storage.
  Future<void> _savePostsToSecureStorage(List<PostModel> posts) async {
    final String jsonString =
        jsonEncode(posts.map((post) => post.toJson()).toList());
    await secureStorage.write(key: _postsKey, value: jsonString);
  }

  /// Saves a single [PostModel] to secure storage.
  Future<void> _savePostToSecureStorage(PostModel post) async {
    final posts = await _getPostsFromSecureStorage() ?? [];
    final updatedPosts = List<PostModel>.from(posts)..add(post);
    final String jsonString =
        jsonEncode(updatedPosts.map((p) => p.toJson()).toList());
    await secureStorage.write(key: _postsKey, value: jsonString);
  }

  /// Retrieves the list of [PostModel] from secure storage.
  Future<List<PostModel>?> _getPostsFromSecureStorage() async {
    final jsonString = await secureStorage.read(key: _postsKey);
    if (jsonString != null) {
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map((post) => PostModel.fromJson(post)).toList();
    }
    return null;
  }

  /// Retrieves a single [PostModel] by ID from secure storage.
  Future<PostModel?> _getPostFromSecureStorageById(int id) async {
    final posts = await _getPostsFromSecureStorage();
    if (posts != null) {
      return posts.firstWhere((post) => post.id == id,
          orElse: () =>
              const PostModel(userId: -1, id: -1, title: '', body: ''));
    }
    return null;
  }

  /// Retrieves the list of [PostModel] from secure storage.
  @override
  Future<List<PostModel>?> getCachedPosts() async {
    final jsonString = await secureStorage.read(key: _postsKey);
    if (jsonString != null) {
      final List<dynamic> data = jsonDecode(jsonString);
      return data.map((post) => PostModel.fromJson(post)).toList();
    }
    return null;
  }

  /// Retrieves a single [PostModel] by its ID from secure storage.
  @override
  Future<PostModel?> getCachedPostById(int id) async {
    final jsonString = await secureStorage.read(key: 'POST_$id');
    if (jsonString != null) {
      return PostModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
