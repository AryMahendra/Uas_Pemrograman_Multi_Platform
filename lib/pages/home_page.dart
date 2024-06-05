import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContent extends StatefulWidget {
  final List bookmarkedArticles;

  HomePageContent({required this.bookmarkedArticles});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  // Menggunakan data statis untuk testing
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
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 345),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x7DD9D9D9)),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 31.5, 0.6, 32.5),
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
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sedang Tren',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Berita Baru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
