import 'package:equatable/equatable.dart';

/// Abstract class for post-related events.
abstract class PostsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event to fetch all posts.
class FetchPostsEvent extends PostsEvent {}

/// Event to fetch a single post by its ID.
class FetchPostByIdEvent extends PostsEvent {
  final int id;

  FetchPostByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SearchPostsEvent extends PostsEvent {
  final String query;

  SearchPostsEvent(this.query);
}
