import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

    const HomePage({super.key});

    static const List<String> items = <String>[
        'Music',
        // Add more items here
    ];
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(            
                child: Column(
                    children: [
                        for (var item in items)
                        ElevatedButton(
                            onPressed: () {
                                print("Navigate to "+item+"'s feed");
                            },
                            child: Text(item),
                        ),
                    ],
                ),
            ),
        );
    }
}
