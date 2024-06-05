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
      'image': 
      'assets/images/image1.jpg'
    },
    {
      'title':
      'Mahasiswa Undiknas Ajak Generasi Z Ikut Pemilu 2024',
      'description':
      'Ajakan agar generasi Z untuk menggunakan hak pilih di Pemilu 2024 pun digalakkan Mahasiswa Undiknas Denpasar.Ajakan itu disampaikan Mahasiswa Undiknas saat mengikuti podcast di Studio RRI Kota Denpasar dengan tema "Peran Mahasiswa Bali dalam Pemilu 2024" pada Senin 12 Februari 2024.Artikel ini telah tayang di Tribun-Bali.com dengan judul Mahasiswa Undiknas Ajak Generasi Z Ikut Pemilu 2024.',
      'image':
      'assets/images/image2.jpg'
    },
    {
      'title':
      'KKN Tematik Pemilu Mahasiswa Undiknas Turut Sukseskan Pemilu 2024',
      'description':
      'Di Kota Denpasar, partisipasi para mahasiswa dari Universitas Pendidikan Nasional (Undiknas) menjadi contoh nyata kontribusi kaum muda dalam menyukseskan Pemilu 2024. Sebanyak 765 mahasiswa diterjunkan ke seluruh wilayah Denpasar untuk melakukan sosialisasi dan membantu penyelenggara di tingkat desa/kelurahan dan kecamatan.',
      'image':
      'assets/images/image3.jpg'
    },
    {
      'title':
      'Undiknas Hadir dalam World Water Forum ke-10: Mengidentifikasi Masalah dan Solusi Keairan Global',
      'description':
      'Universitas Pendidikan Nasional (Undiknas) turut berpartisipasi dalam World Water Forum ke-10 yang diselenggarakan di Bali pada tanggal 18-24 Mei 2024. Forum sektor air terbesar di dunia ini dihadiri oleh 33 kepala negara dan 190 menteri dari 180 negara, termasuk akademisi, praktisi, dan mahasiswa dari berbagai belahan dunia. Kehadiran Undiknas dalam acara ini menunjukkan komitmen universitas dalam mengatasi isu sumber daya air global yang semakin mendesak di tengah meningkatnya kebutuhan air dan kesulitan akses air berkualitas.',
      'image':
      'assets/images/image4.jpg.png'
    },
    {
      'title':
      'Sosialisasi Empat Konsensus Bangsa Bersama Made Mangku Pastika di Universitas Pendidikan Nasional',
      'description':
      'Kegiatan sosialisasi yang bertajuk “Penguatan dan Penegakan Nilai Empat Konsensus Bangsa Untuk Menjinakan Politik Identitas” sukses digelar di Universitas Pendidikan Nasional (Undiknas). Acara ini menghadirkan tiga pembicara ahli, yaitu Komisaris Jenderal Polisi (Purnawirawan) Dr. Made Mangku Pastika, M.M., seorang politikus dan purnawirawan polisi Indonesia, Dr. Ni Wayan Widhiasthini S.Sos, M.Si., yang merupakan dosen di Universitas Pendidikan Nasional dan Dr. Drs. I Nyoman Subanda, M.Si., yang juga merupakan dosen di Universitas Pendidikan Nasional. Rangkaian seminar kali ini membahas pentingnya konsensus nasional dalam menjaga kesatuan dan keharmonisan bangsa yang diselenggarakan di Auditorium Dwi Tunggal Undiknas Denpasar, dan dihadiri oleh jajaran mahasiswa beserta dosen di lingkungan Undiknas.',
      'image':
      'assets/images/image5.png'
    },
    {
      'title':
      'Kuliah Umum Mahasiswa Undiknas Bersama Gubernur Bali Bapak I Wayan Koster',
      'description':
      'Universitas Pendidikan Nasional (Undiknas) menggelar rangkaian kegiatan Kuliah Umum yang kali ini bersama Bapak Dr. Ir. I Wayan Koster, M.M. Kegiatan berlangsung pada Senin, 29 April 2024, di Auditorium Dwi Tunggal Undiknas Denpasar. Rangkaian acara dibuka secara resmi oleh Rektor Undiknas, Prof. Dr. Ir. Nyoman Sri Subawa, S.T., S.Sos., M.M., IPM., ASEAN Eng., yang juga menjadi momentum penting bagi para mahasiswa Universitas Pendidikan Nasional untuk mendapatkan wawasan yang mendalam dari seorang tokoh terkemuka.',
      'image':
      'assets/images/image6.png'
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
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                child: ListTile(
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
                        if (widget.bookmarkedArticles
                            .contains(articles[index])) {
                          widget.bookmarkedArticles.remove(articles[index]);
                          widget.onBookmarkRemoved(articles[index]);
                        } else {
                          widget.bookmarkedArticles.add(articles[index]);
                        }
                      });
                    },
                  ),
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
