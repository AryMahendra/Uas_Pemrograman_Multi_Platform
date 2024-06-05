import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContent extends StatelessWidget {
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
        ],
      ),
    );
  }
}
