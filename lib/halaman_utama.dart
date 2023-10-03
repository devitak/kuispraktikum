import 'package:flutter/material.dart';

import 'data_buku.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Data Buku', textAlign: TextAlign.center),
      ),
      body: GridView.builder(
          itemCount: listBuku.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final DataBuku perpustakaan = listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) { return HalamanDetail(perpustakaan : perpustakaan);
                        }));
              },
              child: Flexible(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Image.network(perpustakaan.imageLink),
                        ),
                        SizedBox(width: 5),
                        Text(perpustakaan.author,
                          style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}