import 'package:flutter/material.dart';
import 'screens/communities.dart';

void main() {
    runApp(const MyApp());
}
class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'TravelComm',
            theme: ThemeData(
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
                useMaterial3: true,
            ),
            home: const NavBar(),
        );
    }
}

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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CommunitiesPage()),
                                );
                            },
                            child: Text(item),
                        ),
                    ],
                ),
            ),
        );
    }
}


class NavBar extends StatefulWidget {
    const NavBar({super.key});

    @override
    State<NavBar> createState() => _NavBarState();
}
class _NavBarState extends State<NavBar> {
    int _selectedIndex = 0;
    static const List<Widget> _widgetOptions = <Widget>[
        HomePage(),
        Text('Create Page'),
        Text('Feed Page'),
    ];

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

   @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('TravelComm'),
            ),
            body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        label: 'Create',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.feed),
                        label: 'Feed',
                    ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.deepOrange,
                onTap: _onItemTapped,
            ),
        );
    }
}
