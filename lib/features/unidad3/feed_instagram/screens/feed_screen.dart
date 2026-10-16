import 'package:flutter/material.dart';

import '../utils/mock_data.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlutterGram',
          style: TextStyle(fontFamily: 'cursive', fontSize: 28),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: mockPosts.length,
        itemBuilder: (context, index) {
          final postActual = mockPosts[index];
          return PostCard(post: postActual);
        },
      ),
    );
  }
}