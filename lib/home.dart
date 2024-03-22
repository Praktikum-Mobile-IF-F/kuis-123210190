import 'package:flutter/material.dart';
import 'package:frederick190/login.dart';
import 'package:frederick190/square.dart';
import 'package:frederick190/top_album.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Album'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return MySquare(
            topAlbum: topAlbumList[index],
          );
        },
        itemCount: topAlbumList.length,
      ),
    );
  }
}