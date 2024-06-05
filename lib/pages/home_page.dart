import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContent extends StatefulWidget {
  final List bookmarkedArticles;
  final Function(Map) onBookmarkRemoved;

  HomePageContent({
    required this.bookmarkedArticles,
    required this.onBookmarkRemoved,
  });

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List articles = [
    {
      'title':
          'Prof Sri Subawa Dilantik Kembali Jadi Rektor Undiknas, Berjanji Tambah terus Prodi dan Tingkatkan Kapasitas dan Kualitas Dosen',
      'description':
          'Acara pelantikan Rektor Universitas Pendidikan Nasional untuk periode kedua 2024-2029 berlangsung dengan suasana meriah dihadiri oleh civitas akademika Undiknas, jajaran pejabat Universitas, para pendiri, termasuk tamu undangan yang berasal dari berbagai institusi yang ada di wilayah Bali.',
      'image': 'assets/images/image1.jpg'
    },
    {
      'title': 'Mahasiswa Undiknas Ajak Generasi Z Ikut Pemilu 2024',
      'description':
          'Ajakan agar generasi Z untuk menggunakan hak pilih di Pemilu 2024 pun digalakkan Mahasiswa Undiknas Denpasar.Ajakan itu disampaikan Mahasiswa Undiknas saat mengikuti podcast di Studio RRI Kota Denpasar dengan tema "Peran Mahasiswa Bali dalam Pemilu 2024" pada Senin 12 Februari 2024.Artikel ini telah tayang di Tribun-Bali.com dengan judul Mahasiswa Undiknas Ajak Generasi Z Ikut Pemilu 2024.',
      'image': 'assets/images/image2.jpg'
    },
    {
      'title':
          'KKN Tematik Pemilu Mahasiswa Undiknas Turut Sukseskan Pemilu 2024',
      'description':
          'Di Kota Denpasar, partisipasi para mahasiswa dari Universitas Pendidikan Nasional (Undiknas) menjadi contoh nyata kontribusi kaum muda dalam menyukseskan Pemilu 2024. Sebanyak 765 mahasiswa diterjunkan ke seluruh wilayah Denpasar untuk melakukan sosialisasi dan membantu penyelenggara di tingkat desa/kelurahan dan kecamatan.',
      'image': 'assets/images/image3.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    print('Building HomePageContent');

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
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
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: AspectRatio(
                  aspectRatio: 1, // Untuk mempertahankan aspek rasio gambar
                  child: Image.asset(
                    articles[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  articles[index]['title'],
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    articles[index]['description'],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
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
            childCount: articles.length,
          ),
        ),
      ],
    );
  }
}
