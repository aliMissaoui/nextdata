import 'package:nextdata/src/features/home/domain/entities/post.dart';

/// PostModel class extends User entity to represent a post with additional data handling capabilities.
class PostModel extends Post {
  /// Default constructor for PostModel.
  /// Inherits properties from Post entity.
  const PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  /// Factory method to create a PostModel instance from a JSON map.
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  /// Converts the PostModel instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
