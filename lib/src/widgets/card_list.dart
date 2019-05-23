import 'package:flutter/material.dart';
import '../models/dog_model.dart';

class cardList extends StatelessWidget {
  final List<DogModel> images;

  cardList(this.images);

Widget build(context) {

  if(this.images.length > 0){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context , int index) {
        return buildcard(images[index]);
      }
    );

  }
  return Center(child: Text("No doggy here"));
  }

  Widget buildcard(DogModel image){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Image.network(image.url),
    );
  }
}