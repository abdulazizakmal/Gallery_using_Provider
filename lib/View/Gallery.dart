import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/Provider/AlbumProvider.dart';
import 'package:provider_sample/model/Core/Album.dart';
import 'package:provider_sample/model/Core/Photos.dart';
import 'package:provider_sample/View/Albumview.dart';


class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<AlbumProvider>();
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: list.GetThumbnails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Display(thumbnails: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}

class Display extends StatelessWidget {
  List<Photo> thumbnails;
  Display({Key key,this.thumbnails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gallery'),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: GridView.builder(
              itemCount: thumbnails.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index){
                return new Card(
                    child: new InkResponse(
                        child: Image.network(thumbnails[index].thumbnailUrl),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Albumview(i: thumbnails[index].albumId)))
                    )

                );
              }
          ),
        )
    );
  }
}

