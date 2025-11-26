
import 'package:flutter/material.dart';

class Itembasket extends StatelessWidget {
  final String image;
  final String title ;

  const Itembasket({super.key, required this.title,required this.image});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("$image" ,width: 150,),
          Text("$title"),
          Icon(Icons.delete,size: 30,color: Colors.red,)

        ],
      ),
    );
  }
}