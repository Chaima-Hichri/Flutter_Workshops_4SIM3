
import 'package:flutter/material.dart';

class itemGridView extends StatelessWidget {
  final String image;
  final String title ;
  const itemGridView({super.key,required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset("$image"),
           SizedBox(height: 5),
           Text("$title")
          ],
        ),
      ),
    );
  }
}
