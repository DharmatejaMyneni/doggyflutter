import 'package:flutter/material.dart';

import 'package:http/http.dart' show get;
import 'models/dog_model.dart'; // dog model
import 'dart:convert'; // for parsing JSON strings

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MyApp>{
  bool IsLoaderActive = false;
  List<DogModel> images = [];

  Future fetchDog() async {
    setState(() {
     IsLoaderActive = true; 
    });

    var response = await get('https://random.dog/woof.json');
    var finalimages = DogModel(json.decode(response.body));

    setState(() {
     IsLoaderActive = false;
     images.add(finalimages);

    });
  }

   Widget build(context){
     return MaterialApp(
       home: Scaffold(
         body: Container(),
         floatingActionButton: FloatingActionButton(
           child: Icon(Icons.refresh),
           backgroundColor: Colors.deepPurpleAccent[500],
           onPressed: fetchDog
         ),
         appBar: AppBar(
           title: Text("We are Doggos"),
           backgroundColor: Colors.black54, 
         ),
       ),
     );
   }
}