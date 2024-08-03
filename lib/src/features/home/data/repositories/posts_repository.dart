import 'package:nextdata/src/core/error/result.dart';
import 'package:nextdata/src/features/home/domain/entities/post.dart';

/// Abstract class representing post operations.
abstract class PostRepository {
  /// Fetches a list of posts.
  ///
  /// Returns a [Future] that resolves to a [Result] containing a list of [Post] if successful,
  /// or an error if the fetch fails.
  Future<Result<List<Post>>> getPosts();

  /// Fetches a single post by its ID.
  ///
  /// Returns a [Future] that resolves to a [Result] containing a [Post] if successful,
  /// or an error if the fetch fails.
  Future<Result<Post>> getPostById(int id);
}
