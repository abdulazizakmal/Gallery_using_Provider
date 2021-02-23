import 'package:provider_sample/model/Services/PhotosApi.dart';
import 'package:provider_sample/model/Core/Photos.dart';
import 'dart:convert';

class PhotosHelper {
  final _photos = PhotosApi();
  Future<List<Photo>> parsePhotos() async {
    String photosJSON = await _photos.fetchPhotos();
    final parsed = jsonDecode(photosJSON).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}