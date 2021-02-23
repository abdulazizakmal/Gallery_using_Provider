import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/Provider/AlbumProvider.dart';
import 'package:provider_sample/View/imageView.dart';
import 'package:provider_sample/model/Core/Album.dart';
import 'package:provider_sample/model/Core/Photos.dart';
import 'package:provider_sample/View/Albumview.dart';



class Albumview extends StatelessWidget {
  final int i;
  Albumview({Key key, this.i}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    var list = context.watch<AlbumProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(i.toString()),
      ),
      body: FutureBuilder<List<Photo>>(
        future: list.fetchFilteredList(i),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotosList(photos: snapshot.data,i: i+1)
              : Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  final int i;
  PhotosList({Key key, this.photos, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: GridView.builder(
              itemCount: photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index){
                return new Card(
                    child: new InkResponse(
                        child: Image.network(photos[index].thumbnailUrl),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> imageView(image: photos[index].thumbnailUrl)))
                    )

                );
              }
          ),
        )
    );
  }
}

