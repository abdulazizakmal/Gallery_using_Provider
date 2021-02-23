import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class AlbumsApi {

  Future<String> fetchAlbums() async {
    String endpoint = "jsonplaceholder.typicode.com";
    final uri = Uri.https(endpoint, "/albums");
    final response = await http.get(uri);

    // Use the compute function to run parsePhotos in a separate isolate.
    return response.body;
  }

}