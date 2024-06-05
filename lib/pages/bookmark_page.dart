import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List bookmarkedArticles;
  final Function(Map) onRemoveBookmark;

  BookmarkPage(
      {required this.bookmarkedArticles, required this.onRemoveBookmark});

  @override
  Widget build(BuildContext context) {
    print('Building BookmarkPage'); // Log untuk debug
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: bookmarkedArticles.isEmpty
          ? Center(
              child: Text(
                'No bookmarks yet!',
                style: TextStyle(fontSize: 24),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedArticles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookmarkedArticles[index]['title']),
                  subtitle: Text(bookmarkedArticles[index]['description']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      onRemoveBookmark(bookmarkedArticles[index]);
                    },
                  ),
                );
              },
            ),
    );
  }
}
