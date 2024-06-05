import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Center(
        child: Text(
          'No bookmarks yet!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
