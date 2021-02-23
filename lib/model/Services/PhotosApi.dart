import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:provider_sample/model/Core/Photos.dart';

class PhotosApi {

  Future<String> fetchPhotos() async {
    String endpoint = "jsonplaceholder.typicode.com";
    final uri = Uri.https(endpoint, "/photos");
    final response = await http.get(uri);

    // Use the compute function to run parsePhotos in a separate isolate.
    return response.body;
  }
}