import 'package:flutter/material.dart';
import 'package:frederick190/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final TopAlbum topAlbum;

  const DetailPage({
    Key? key,
    required this.topAlbum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topAlbum.albumName),
        actions: [
          IconButton(
            onPressed: () {
              _launchURL(topAlbum.albumurl);
            },
            icon: Icon(Icons.share),
            tooltip: 'Open Spotify in Browser',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 350,
                child: Image.network(topAlbum.imageUrls, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    topAlbum.albumName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    topAlbum.singer,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 55.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today),
                        Expanded(
                          child: Text(
                            topAlbum.releaseDate,
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(Icons.business),
                        Expanded(
                          child: Text(
                            topAlbum.source,
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Song List:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: topAlbum.songs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: ListTile(
                              title: Text(
                                topAlbum.songs[index],
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String albumurl) async {
    final url = albumurl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
