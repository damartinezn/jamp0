import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  File _picture;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Center(
            child: _picture == null
                ?  Text('no hay foto')
                : Image.file(_picture),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _opernCamera,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),
            FloatingActionButton(
              onPressed: _openGalery,
              tooltip: 'Pick Image',
              child: Icon(Icons.wallpaper),
            )
            
          ],
        )
      ],      
    );
      
  }

  void _opernCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _picture = picture;
    });
  }

  void _openGalery(){
    var picture = ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _picture = picture as File;
    });
  }
}