import 'package:provider_sample/model/Services/AlbumsApi.dart';
import 'package:provider_sample/model/Services/PhotosApi.dart';
import 'package:provider_sample/model/Core/Album.dart';
import 'dart:convert';

class AlbumHelper{
  final _albums = AlbumsApi();
  // final _photos = PhotosApi();

  Future<List<Album>> parseAlbums() async {
   String albumjson = await _albums.fetchAlbums();
    final parsed = jsonDecode(albumjson).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }

}