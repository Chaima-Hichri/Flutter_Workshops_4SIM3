
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String title ;
  const CardWidget({super.key,required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset("assets/images/$image"),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$title",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                  Icon(Icons.star,color: Colors.amber,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
