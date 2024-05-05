import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class FeedPage extends StatefulWidget {
    const FeedPage({Key? key}) : super(key: key);

    @override
    _FeedPageState createState() => _FeedPageState();
}

class _SampleCard extends StatelessWidget {
    const _SampleCard({required this.children, this.width = 300.0, this.height = 100.0});
    // children
    final List<Widget> children;
    final double width;
    final double height;
    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: width,
            height: height,
            child: Column(
                children: children,
            ),         
        );
    }
}

 
class _FeedPageState extends State<FeedPage> {
    
    // Mock posts
    List<Post> posts = [
        Post(title: 'Title 1', author: 'Author 1', category: 'Category 1', date: 'Date 1', content: 'Content 1'),
        Post(title: 'Title 2', author: 'Author 2', category: 'Category 2', date: 'Date 2', content: 'Content 2'),
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
            body: Column(
                children: [
                    for (var post in posts)
                    Card(
                       child: _SampleCard(
                            width: 700.0,
                            height: 300.0,
                            children: [
                                Text(post.category+": "+post.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Card.filled(child: _SampleCard(width: 600, height: 200, children: [Text(post.content, style: const TextStyle(fontSize: 15))])),
                                Text(post.author+" - "+post.date, style: const TextStyle(fontSize: 15)),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
