import 'package:flutter/material.dart';
class imageView extends StatelessWidget {
  String image;
  imageView({Key key, @required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: new Image.network(image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center),

    );
  }
}
