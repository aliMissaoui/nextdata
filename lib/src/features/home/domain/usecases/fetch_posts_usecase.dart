import 'package:nextdata/src/features/home/domain/entities/post.dart';
import '../../../../core/error/result.dart';
import '../../data/repositories/posts_repository.dart';

/// Use case responsible for fetching the list of posts.
class FetchPostsUseCase {
  final PostRepository repository;

  /// Constructor that requires an instance of [PostRepository].
  FetchPostsUseCase(this.repository);

  /// Executes the fetch operation.
  ///
  /// Returns a [Result] containing a [List<Post>] if successful,
  /// or an Exception if fetching fails.
  Future<Result<List<Post>>> call() async {
    return await repository.getPosts();
  }
}
