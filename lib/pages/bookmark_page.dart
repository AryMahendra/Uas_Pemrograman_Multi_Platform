import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List bookmarkedArticles;
  final List readArticles; // List artikel yang sudah dibaca
  final Function(Map) onRemoveBookmark;

  BookmarkPage({
    required this.bookmarkedArticles,
    required this.readArticles,
    required this.onRemoveBookmark,
  });

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
                // Periksa apakah artikel sudah dibaca
                bool isRead = readArticles.contains(bookmarkedArticles[index]);

                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    onRemoveBookmark(bookmarkedArticles[index]);
                  },
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        bookmarkedArticles[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(bookmarkedArticles[index]['title']),
                    subtitle: Text(bookmarkedArticles[index]['description']),
                    // Tambahkan penanda untuk menandai artikel yang sudah dibaca
                    trailing: isRead
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : null,
                  ),
                );
              },
            ),
    );
  }
}
