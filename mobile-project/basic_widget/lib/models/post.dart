class Post {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime createdAt;
  final String authorId;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
    required this.authorId,
  });

  // Chuyển đổi Post thành Map để lưu trữ
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'authorId': authorId,
    };
  }

  // Tạo Post từ Map
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      createdAt: DateTime.parse(map['createdAt']),
      authorId: map['authorId'],
    );
  }
} 