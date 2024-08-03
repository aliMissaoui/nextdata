import 'package:bloc/bloc.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/fetch_post_by_id_usecase.dart';
import '../../domain/usecases/fetch_posts_usecase.dart';
import 'posts_event.dart';
import 'posts_state.dart';

/// Business Logic Component (BLoC) for handling post-related events and states.
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FetchPostsUseCase getPostsUseCase;
  final FetchPostByIdUseCase getPostByIdUseCase;
  late List<Post> _allPosts;

  PostsBloc({
    required this.getPostsUseCase,
    required this.getPostByIdUseCase,
  }) : super(PostsInitial()) {
    // Initialize event handlers for specific events.
    on<FetchPostsEvent>(_onFetchPosts);
    on<FetchPostByIdEvent>(_onFetchPostById);
    on<SearchPostsEvent>(_onSearchPosts);
  }

  /// Handles the [FetchPostsEvent] by emitting appropriate states.
  Future<void> _onFetchPosts(
      FetchPostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading()); // Notify UI that posts fetching has started.
    try {
      final result = await getPostsUseCase();

      // Handle the result of the get posts use case.
      result.when(
        success: (posts) {
          _allPosts = posts;
          emit(PostsLoaded(posts: posts)); // Posts fetched successfully.
        },
        failure: (error) => emit(PostsError(error.message)), // Fetching failed.
      );
    } catch (e) {
      emit(PostsError('An unexpected error occurred.'));
    }
  }

  /// Handles the [FetchPostByIdEvent] by emitting appropriate states.
  Future<void> _onFetchPostById(
      FetchPostByIdEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading()); // Notify UI that post fetching has started.
    try {
      final result = await getPostByIdUseCase(event.id);

      // Handle the result of the get post by ID use case.
      result.when(
        success: (post) =>
            emit(PostLoaded(post: post)), // Post fetched successfully.
        failure: (error) => emit(PostsError(error.message)), // Fetching failed.
      );
    } catch (e) {
      emit(PostsError('An unexpected error occurred.'));
    }
  }

  /// Handles the [SearchPostsEvent] by emitting filtered posts.
  void _onSearchPosts(SearchPostsEvent event, Emitter<PostsState> emit) {
    if (event.query.isEmpty) {
      emit(PostsLoaded(posts: _allPosts)); // Show all posts if query is empty.
    } else {
      final filteredPosts = _allPosts.where((post) {
        final lowerQuery = event.query.toLowerCase();
        return post.title.toLowerCase().contains(lowerQuery) ||
            post.body.toLowerCase().contains(lowerQuery);
      }).toList();
      emit(PostsLoaded(posts: filteredPosts)); // Emit filtered posts.
    }
  }
}
