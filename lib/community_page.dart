import 'dart:async';
import 'dart:convert';
import 'dart:html' as html; 
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'community_service.dart';
import 'post_model.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final CommunityService _communityService = CommunityService();
  final TextEditingController _contentController = TextEditingController();

  String? _imageBase64; 

  late String loggedInUsername;
  String loggedInAvatarUrl = 'https://i.pravatar.cc/150?img=3';


  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      loggedInUsername = user.email!.split('@')[0];
    } else {
      loggedInUsername = 'UnknownUser';
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final html.FileUploadInputElement input = html.FileUploadInputElement();
      input.accept = 'image/*';
      input.click();

      input.onChange.listen((event) {
        final files = input.files;
        if (files == null || files.isEmpty) return;
        final file = files[0];
        final reader = html.FileReader();

        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((event) {
          setState(() {
            _imageBase64 = reader.result as String?;
          });
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image picking only supported on web demo now.')),
      );
    }
  }

  Future<void> _submitPost() async {
    final content = _contentController.text.trim();
    if (content.isEmpty && _imageBase64 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add some text or select an image.')),
      );
      return;
    }

    await _communityService.addPost(
      content,
      loggedInUsername,
      loggedInAvatarUrl,
      imageUrl: _imageBase64,
    );

    setState(() {
      _contentController.clear();
      _imageBase64 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    
    final backgroundColor = _isDarkTheme ? Colors.grey[900] : const Color(0xFFF3F4F6);
    final cardColor = _isDarkTheme ? Colors.grey[800] : Colors.white;
    final appBarColor = _isDarkTheme ? Colors.indigo.shade900 : Colors.indigo.shade600;
    final textColor = _isDarkTheme ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Community Feed'),
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        elevation: 3,
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode, color: Colors.white70, size: 20),
              Switch(
                value: _isDarkTheme,
                onChanged: (val) {
                  setState(() {
                    _isDarkTheme = val;
                  });
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white70,
                inactiveTrackColor: Colors.white30,
              ),
              const Icon(Icons.dark_mode, color: Colors.white70, size: 20),
              const SizedBox(width: 8),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, bottomInset + 12),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 3,
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _contentController,
                          maxLines: 3,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            labelText: 'What\'s on your mind?',
                            labelStyle: TextStyle(color: _isDarkTheme ? Colors.white70 : Colors.grey[700]),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: _isDarkTheme ? Colors.white38 : Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: _isDarkTheme ? Colors.white : Colors.indigo),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            fillColor: _isDarkTheme ? Colors.grey[850] : Colors.white,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_imageBase64 != null)
                          Stack(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 250,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    _imageBase64!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      _imageBase64 = null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              icon: const Icon(Icons.image),
                              label: const Text('Add Image'),
                              onPressed: _pickImage,
                              style: TextButton.styleFrom(
                                foregroundColor: _isDarkTheme ? Colors.white : Colors.indigo,
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.send),
                              label: const Text('Post'),
                              onPressed: _submitPost,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 1, color: _isDarkTheme ? Colors.white12 : Colors.grey[300]),
            Expanded(
              child: StreamBuilder<List<Post>>(
                stream: _communityService.getPosts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(color: _isDarkTheme ? Colors.indigo[200] : Colors.indigo),
                    );
                  }

                  final posts = snapshot.data!;
                  if (posts.isEmpty) {
                    return Center(
                      child: Text(
                        'No posts yet.',
                        style: TextStyle(color: textColor),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      final post = posts[i];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        color: cardColor,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(post.avatarUrl),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    post.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: textColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    _formatTimestamp(post.timestamp),
                                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              if (post.content.isNotEmpty)
                                Text(
                                  post.content,
                                  style: TextStyle(fontSize: 15, color: textColor),
                                ),
                              if (post.imageUrl != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: 250,
                                          maxWidth: constraints.maxWidth,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Image.network(post.imageUrl!),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.indigo.shade400),
                                    onPressed: () {
                                      _communityService.likePost(post);
                                    },
                                  ),
                                  Text('${post.likes}', style: TextStyle(color: textColor)),
                                  const SizedBox(width: 16),
                                  Icon(Icons.favorite_border, color: Colors.pink.shade300),
                                  const SizedBox(width: 8),
                                  Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.orange.shade400),
                                  const Spacer(),
                                  Icon(Icons.comment_outlined, color: Colors.grey.shade500),
                                  const SizedBox(width: 4),
                                  Text('${post.comments.length}', style: TextStyle(color: textColor)),
                                ],
                              ),
                              _CommentInput(post: post, communityService: _communityService, isDarkTheme: _isDarkTheme),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime dt) {
    final now = DateTime.now();
    final difference = now.difference(dt);

    if (difference.inSeconds < 60) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

class _CommentInput extends StatefulWidget {
  final Post post;
  final CommunityService communityService;
  final bool isDarkTheme;

  const _CommentInput({
    required this.post,
    required this.communityService,
    required this.isDarkTheme,
  });

  @override
  State<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<_CommentInput> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    widget.communityService.addComment(widget.post, text);
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: widget.isDarkTheme ? Colors.white54 : Colors.grey.shade400,
        width: 1,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              style: TextStyle(color: widget.isDarkTheme ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                hintStyle: TextStyle(color: widget.isDarkTheme ? Colors.white54 : Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                enabledBorder: inputBorder,
                focusedBorder: inputBorder.copyWith(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                filled: true,
                fillColor: widget.isDarkTheme ? Colors.grey[850] : Colors.white,
              ),
              onSubmitted: (_) => _submitComment(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: widget.isDarkTheme ? Colors.indigo[200] : Colors.indigo),
            onPressed: _submitComment,
          ),
        ],
      ),
    );
  }
}
