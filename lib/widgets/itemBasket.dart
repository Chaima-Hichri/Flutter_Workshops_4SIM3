
import 'dart:ffi';

import 'package:flutter/material.dart';

class Itembasket extends StatelessWidget {
  final String image;
  final String title ;
  final VoidCallback deleteItem;

  const Itembasket({super.key,
    required this.title,
    required this.image,
    required this.deleteItem});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("$image" ,width: 150,),
          Text("$title"),
          GestureDetector(
            onTap: deleteItem,
              child: Icon(Icons.delete,size: 30,color: Colors.red,))

        ],
      ),
    );
  }
}