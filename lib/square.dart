import 'package:flutter/material.dart';
import 'package:frederick190/detail.dart';
import 'package:frederick190/top_album.dart';


class MySquare extends StatelessWidget {
  final TopAlbum topAlbum;

  MySquare({
    required this.topAlbum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(
              topAlbum: topAlbum,
            )),
          );
        },
        title: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Image.network(topAlbum.imageUrls, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
