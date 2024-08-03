import 'package:nextdata/src/features/home/domain/entities/post.dart';
import '../../../../core/error/result.dart';
import '../../data/repositories/posts_repository.dart';

/// Use case responsible for fetching a single post by its ID.
class FetchPostByIdUseCase {
  final PostRepository repository;

  /// Constructor that requires an instance of [PostRepository].
  FetchPostByIdUseCase(this.repository);

  /// Executes the fetch operation for a post by its ID.
  ///
  /// Returns a [Result] containing a [Post] if successful,
  /// or an Exception if fetching fails.
  Future<Result<Post>> call(int id) async {
    return await repository.getPostById(id);
  }
}
