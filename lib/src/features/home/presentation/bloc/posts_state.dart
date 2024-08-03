import 'package:equatable/equatable.dart';
import '../../domain/entities/post.dart';

/// Abstract class for post-related states.
abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Initial state for posts.
class PostsInitial extends PostsState {}

/// State representing a loading state for posts.
class PostsLoading extends PostsState {}

/// State representing a successfully fetched list of posts.
class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

/// State representing a successfully fetched single post.
class PostLoaded extends PostsState {
  final Post post;

  PostLoaded({required this.post});

  @override
  List<Object> get props => [post];
}

class PostsFiltered extends PostsState {
  final List<Post> filteredPosts;

  PostsFiltered(this.filteredPosts);
}

/// State representing an error occurred during fetching.
class PostsError extends PostsState {
  final String message;

  PostsError(this.message);

  @override
  List<Object> get props => [message];
}
