import 'package:equatable/equatable.dart';

/// Represents a post entity in the application.
class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [
        userId,
        id,
        title,
        body,
      ];

  @override
  bool get stringify => true;
}
