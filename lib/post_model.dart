class Post {
  final String userId;
  final String username;
  final String avatarUrl;
  final String content;
  final String? imageUrl; 
  final DateTime timestamp;
  final int likes;
  final List<String> comments;

  Post({
    required this.userId,
    required this.username,
    required this.avatarUrl,
    required this.content,
    this.imageUrl, 
    required this.timestamp,
    this.likes = 0,
    this.comments = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'avatarUrl': avatarUrl,
      'content': content,
      'imageUrl': imageUrl, 
      'timestamp': timestamp.toIso8601String(),
      'likes': likes,
      'comments': comments,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      username: map['username'],
      avatarUrl: map['avatarUrl'],
      content: map['content'],
       imageUrl: map['imageUrl'],
      timestamp: DateTime.parse(map['timestamp']),
      likes: map['likes'] ?? 0,
      comments: List<String>.from(map['comments'] ?? []),
    );
  }
}

