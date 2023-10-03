import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data_buku.dart';


class HalamanDetail extends StatefulWidget {
  final DataBuku perpustakaan;
  HalamanDetail({super.key, required this.perpustakaan});

  @override
  _HalamanDetailState createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    String year = widget.perpustakaan.year.toString();
    String page = widget.perpustakaan.pages.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Things Fall Apart', textAlign: TextAlign.center),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              _toggleFavorite(context);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(1),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            Image.network(widget.perpustakaan.imageLink),
            SizedBox(height:1),
            Text(
              "Judul Buku: ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.perpustakaan.title,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8.0),
            Text(
              "Pengarang:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.perpustakaan.author,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
            Text(
              "Tahun Terbit:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              year,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              "Negara",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.perpustakaan.country,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              "Bahasa:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.perpustakaan.language,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              "Jumlah Halaman",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              page,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcurl(widget.perpustakaan.imageLink);
        },
        child: Icon(Icons.search),
      ),
    );
  }
  void _toggleFavorite(BuildContext context) {
    setState(() {
      isBookmark = !isBookmark;
    });

    final snackBar = SnackBar(
      content: Text(isBookmark
          ? "Berhasil Menambahkan Bookmark"
          : "Berhasil Menghapus Bookmark"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _launcurl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("gagal buka link : $_url");
    }
  }
}
