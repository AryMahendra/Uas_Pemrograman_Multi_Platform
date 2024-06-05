import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/bookmark_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UndikNews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List bookmarkedArticles = [];

  List<Widget> _widgetOptions() => <Widget>[
        HomePageContent(bookmarkedArticles: bookmarkedArticles),
        BookmarkPage(bookmarkedArticles: bookmarkedArticles),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected index: $_selectedIndex'); // Log untuk debug
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building MyHomePage with index $_selectedIndex'); // Log untuk debug
    return Scaffold(
      appBar: AppBar(
        title: Text('UndikNews'),
      ),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
