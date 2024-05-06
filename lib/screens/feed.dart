import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class PostCard extends StatelessWidget {
  const PostCard({required this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.category+": "+post.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

              ]
            ),
          ),
          Card.filled(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.content,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.author+" - "+post.date,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}


class _FeedPageState extends State<FeedPage> {

  // Mock posts
  List<Post> posts = [
    Post(title: 'Title 1', author: 'Author 1', category: 'Category 1', date: 'Date 1', content: 'Content 1'),
    Post(title: 'Title 2', author: 'Author 2', category: 'Category 2', date: 'Date 2', content: 'Content 2'),
    Post(title: 'Title 3', author: 'Author 3', category: 'Category 3', date: 'Date 3', content: 'Content 3'),
    Post(title: 'Title 4', author: 'Author 4', category: 'Category 4', date: 'Date 4', content: 'Content 4'),
    Post(title: 'Title 5', author: 'Author 5', category: 'Category 5', date: 'Date 5', content: 'Content 5'),
    Post(title: 'Title 6', author: 'Author 6', category: 'Category 6', date: 'Date 6', content: 'Content 6'),
    Post(title: 'Title 7', author: 'Author 7', category: 'Category 7', date: 'Date 7', content: 'Content 7'),
    Post(title: 'Title 8', author: 'Author 8', category: 'Category 8', date: 'Date 8', content: 'Content 8'),
  ];

  // Debugging hello endpoint
  Future<http.Response> fetchHello() async {
    final response = await http.get(Uri.parse('http://localhost:3000'));
    print("Hello");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          print("Refresh");
        },
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCard(post: posts[index]);
          },
        ),
      ),
    );
  }
}
