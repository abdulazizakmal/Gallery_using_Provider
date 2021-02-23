import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/Provider/AlbumProvider.dart';
import 'package:provider_sample/View/Albumview.dart';
import 'package:provider_sample/View/imageView.dart';
import 'package:provider_sample/model/Core/Album.dart';

import 'View/Gallery.dart';

void main() {
  runApp(

        ChangeNotifierProvider(

        create: (context) => AlbumProvider(),
         child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Gallery(),
      initialRoute: '/',
      routes: {
        '/' : (context) => Gallery(),
        '/Albumview': (context) => Albumview(),
        '/imageView': (context) => imageView(),
      },
    );
  }
}
