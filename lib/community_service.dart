import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'post_model.dart';

class CommunityService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Post> _staticPosts = [
    Post(
      userId: 'dummy1',
      username: 'Sarah Islam',
      avatarUrl: 'https://ui-avatars.com/api/?name=Sarah+Islam',
      content: 'Anyone applying for Fall 2025 in Computer Science?',
      imageUrl: 'assets/photo1.jpg',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      likes: 3,
      comments: ['Yes! Me too.', 'Let’s connect.'],
    ),
    Post(
      userId: 'dummy2',
      username: 'Ahmed Rafi',
      avatarUrl: 'https://ui-avatars.com/api/?name=Ahmed+Rafi',
      content: 'TOEFL or IELTS? Which one is easier?',
      imageUrl: 'assets/photo2.jpg',
      timestamp: DateTime.now().subtract(Duration(minutes: 12)),
      likes: 5,
      comments: ['IELTS felt easier to me.', 'TOEFL has more resources.'],
    ),
    Post(
      userId: 'dummy3',
      username: 'Rumana Haque',
      avatarUrl: 'https://ui-avatars.com/api/?name=Rumana+Haque',
      content: 'Received my I-20 from ASU! Super excited!',
      imageUrl: 'assets/photo3.png',
      timestamp: DateTime.now().subtract(Duration(minutes: 20)),
      likes: 10,
      comments: ['Congrats!', 'Proud of you!'],
    ),
    Post(
      userId: 'dummy4',
      username: 'Mehedi Hasan',
      avatarUrl: 'https://ui-avatars.com/api/?name=Mehedi+Hasan',
      content: 'Is anyone going to apply to MIT? Please response guys',
      imageUrl: 'assets/photo4.png',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      likes: 2,
      comments: ['Sure! DM me.', 'You can check YouTube too.'],
    ),
    Post(
      userId: 'dummy5',
      username: 'Fariha Kabir',
      avatarUrl: 'https://ui-avatars.com/api/?name=Fariha+Kabir',
      content: 'Booked my visa interview slot for July!',
     // imageUrl: 'assets/photo5.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      likes: 7,
      comments: ['Good luck!', 'You’ll do great.'],
    ),
    Post(
      userId: 'dummy6',
      username: 'Jayed Ahmed',
      avatarUrl: 'https://ui-avatars.com/api/?name=Jayed+Ahmed',
      content: 'Anyone got full funding in Data Science?',
     // imageUrl: 'assets/photo6.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      likes: 4,
      comments: ['Try SUNY.', 'UIUC maybe?'],
    ),
    Post(
      userId: 'dummy7',
      username: 'Tanisha Zaman',
      avatarUrl: 'https://ui-avatars.com/api/?name=Tanisha+Zaman',
      content: 'Lost my passport! 😭 Any tips?',
     // imageUrl: 'assets/photo7.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      likes: 1,
      comments: ['Report to police ASAP!', 'Go to embassy.'],
    ),
    Post(
      userId: 'dummy8',
      username: 'Nasif Rahman',
      avatarUrl: 'https://ui-avatars.com/api/?name=Nasif+Rahman',
      content: 'Visa interview done! Alhamdulillah, approved!',
     // imageUrl: 'assets/photo8.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 4)),
      likes: 12,
      comments: ['MashaAllah!', 'Congratulations bro!'],
    ),
    Post(
      userId: 'dummy9',
      username: 'Tumpa Akter',
      avatarUrl: 'https://ui-avatars.com/api/?name=Tumpa+Akter',
      content: 'Where to upload financial documents in CommonApp?',
      //imageUrl: 'assets/photo9.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 5)),
      likes: 3,
      comments: ['There’s a specific tab.', 'Ask your counselor.'],
    ),
    Post(
      userId: 'dummy10',
      username: 'Hasibul Islam',
      avatarUrl: 'https://ui-avatars.com/api/?name=Hasibul+Islam',
      content: 'Is Duolingo test acceptable for US universities?',
      //imageUrl: 'assets/photo10.jpg',
      timestamp: DateTime.now().subtract(Duration(hours: 6)),
      likes: 6,
      comments: ['Some accept it.', 'Check the university site.'],
    ),

    // Remaining posts without images
    Post(
      userId: 'dummy11',
      username: 'Sadia Nawar',
      avatarUrl: 'https://ui-avatars.com/api/?name=Sadia+Nawar',
      content: 'Just submitted my application to Purdue!',
      timestamp: DateTime.now().subtract(Duration(hours: 8)),
      likes: 8,
      comments: ['Fingers crossed!', 'Hope you get in.'],
    ),
    Post(
      userId: 'dummy12',
      username: 'Raihan Uddin',
      avatarUrl: 'https://ui-avatars.com/api/?name=Raihan+Uddin',
      content: 'Got rejected by Stanford 😞',
      timestamp: DateTime.now().subtract(Duration(hours: 9)),
      likes: 15,
      comments: ['You’ll bounce back!', 'Try other options.'],
    ),
    Post(
      userId: 'dummy13',
      username: 'Nusrat Jahan',
      avatarUrl: 'https://ui-avatars.com/api/?name=Nusrat+Jahan',
      content: 'How to prepare for GRE in 1 month?',
      timestamp: DateTime.now().subtract(Duration(hours: 10)),
      likes: 4,
      comments: ['Mago... Practice every day!', 'Use Magoosh!'],
    ),
    Post(
      userId: 'dummy14',
      username: 'Fahim Mahmud',
      avatarUrl: 'https://ui-avatars.com/api/?name=Fahim+Mahmud',
      content: 'Applied to 7 universities today 😤',
      timestamp: DateTime.now().subtract(Duration(hours: 11)),
      likes: 11,
      comments: ['Respect!', 'Machine bancho?'],
    ),
    Post(
      userId: 'dummy15',
      username: 'Jannat Noor',
      avatarUrl: 'https://ui-avatars.com/api/?name=Jannat+Noor',
      content: 'University shortlisting is so confusing...',
      timestamp: DateTime.now().subtract(Duration(hours: 12)),
      likes: 2,
      comments: ['List your goals.', 'Talk to seniors.'],
    ),
  ];

  final List<Post> _userPosts = [];

  final StreamController<List<Post>> _postController =
      StreamController<List<Post>>.broadcast();

  CommunityService() {
    Future.delayed(Duration.zero, () {
      _postController.add([..._userPosts, ..._staticPosts]);
    });
  }

  Stream<List<Post>> getPosts() => _postController.stream;

  Future<void> addPost(String content, String username, String avatarUrl,
      {String? imageUrl}) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final post = Post(
      userId: user.uid,
      username: username,
      avatarUrl: avatarUrl,
      content: content,
      imageUrl: imageUrl,
      timestamp: DateTime.now(),
    );

    _userPosts.insert(0, post);
    _postController.add([..._userPosts, ..._staticPosts]);
  }

  Future<void> likePost(Post post) async {
    final index = _userPosts.indexOf(post);
    if (index != -1) {
      _userPosts[index] = Post(
        userId: post.userId,
        username: post.username,
        avatarUrl: post.avatarUrl,
        content: post.content,
        imageUrl: post.imageUrl,
        timestamp: post.timestamp,
        likes: post.likes + 1,
        comments: post.comments,
      );
    } else {
      final dummyIndex = _staticPosts.indexOf(post);
      if (dummyIndex != -1) {
        _staticPosts[dummyIndex] = Post(
          userId: post.userId,
          username: post.username,
          avatarUrl: post.avatarUrl,
          content: post.content,
          imageUrl: post.imageUrl,
          timestamp: post.timestamp,
          likes: post.likes + 1,
          comments: post.comments,
        );
      }
    }
    _postController.add([..._userPosts, ..._staticPosts]);
  }

  Future<void> addComment(Post post, String comment) async {
    final index = _userPosts.indexOf(post);
    if (index != -1) {
      final updatedComments = List<String>.from(post.comments)..add(comment);
      _userPosts[index] = Post(
        userId: post.userId,
        username: post.username,
        avatarUrl: post.avatarUrl,
        content: post.content,
        imageUrl: post.imageUrl,
        timestamp: post.timestamp,
        likes: post.likes,
        comments: updatedComments,
      );
    } else {
      final dummyIndex = _staticPosts.indexOf(post);
      if (dummyIndex != -1) {
        final updatedComments = List<String>.from(post.comments)..add(comment);
        _staticPosts[dummyIndex] = Post(
          userId: post.userId,
          username: post.username,
          avatarUrl: post.avatarUrl,
          content: post.content,
          imageUrl: post.imageUrl,
          timestamp: post.timestamp,
          likes: post.likes,
          comments: updatedComments,
        );
      }
    }
    _postController.add([..._userPosts, ..._staticPosts]);
  }
}
