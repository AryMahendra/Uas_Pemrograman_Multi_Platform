import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContent extends StatefulWidget {
  final List bookmarkedArticles;
  final Function(Map) onBookmarkRemoved;

  HomePageContent(
      {required this.bookmarkedArticles, required this.onBookmarkRemoved});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List articles = [
    {'title': 'Berita 1', 'description': 'Deskripsi berita 1'},
    {'title': 'Berita 2', 'description': 'Deskripsi berita 2'},
    {'title': 'Berita 3', 'description': 'Deskripsi berita 3'},
  ];

  @override
  Widget build(BuildContext context) {
    print('Building HomePageContent'); // Log untuk debug
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 32.5),
            child: Center(
              child: Text(
                'Berita Terkini',
                style: GoogleFonts.getFont(
                  'Merriweather',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  height: 1.5,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(articles[index]['title']),
                subtitle: Text(articles[index]['description']),
                trailing: IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: widget.bookmarkedArticles.contains(articles[index])
                        ? Colors.amber
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.bookmarkedArticles.contains(articles[index])) {
                        widget.bookmarkedArticles.remove(articles[index]);
                        widget.onBookmarkRemoved(articles[index]);
                      } else {
                        widget.bookmarkedArticles.add(articles[index]);
                      }
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
