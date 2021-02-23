
import 'dart:async';
import 'package:provider_sample/model/Core/Album.dart';
import 'package:provider_sample/model/Core/Photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_sample/model/helper/AlbumHelper.dart';
import 'package:provider_sample/model/helper/PhotosHelper.dart';

class AlbumProvider extends ChangeNotifier{
  final _albumHelper = AlbumHelper();
  final _photosHelper = PhotosHelper();


  Future<List<Album>> GetAlbums() async{
   List<Album> albumList= await _albumHelper.parseAlbums();
   // notifyListeners();
   return albumList;


  }

  Future<List<Photo>> GetPhotos() async {
    List<Photo> photosList = await _photosHelper.parsePhotos();
    // notifyListeners();
    return photosList;

  }

  Future<List<Photo>> GetThumbnails() async {
    final List<Photo> photosListT = await GetPhotos();
    final List<Album> albumListT = await GetAlbums();
    List<Photo> finalList =[];
    int j=0;
    for(int i=0;j<albumListT.length;i++)
    {
      print(i);
      if(photosListT[i].albumId == albumListT[j].id )
      {

        finalList.add(photosListT[i]);
        j++;

      }
    }
    print(finalList.length);
    // notifyListeners();
    return finalList;
  }

  Future<List<Photo>> fetchFilteredList(int i) async{
    final List<Photo> photosListT = await GetPhotos();
    List<Photo> filteredList =[];
    try{
      filteredList.clear();
      for(int j=0;j<photosListT.length;j++)
      {
        if(photosListT[j].albumId==i)
        {
          filteredList.add(photosListT[j]);

        }
      }
      return filteredList;
    }
    catch (e)
    {
      var abc = e;
    }
  }
}