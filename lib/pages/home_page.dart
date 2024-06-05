import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  fetchArticles() async {
    final response =
        await http.get(Uri.parse('https://api.yournewsapi.com/articles'));
    if (response.statusCode == 200) {
      setState(() {
        articles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          // Berita Sedang Tren
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sedang Tren',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Berita Baru
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Berita Baru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // List of articles
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(articles[index]['title']),
                subtitle: Text(articles[index]['description']),
              );
            },
          ),
        ],
      ),
    );
  }
}
