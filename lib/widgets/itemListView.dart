
import 'package:flutter/material.dart';
import 'package:workshops_flutter_4sim3/constants/constants.dart';

class itemListView extends StatelessWidget {
  final String image;
  final String title ;
  final bool isFavorite;
  final VoidCallback addToFav;
  const itemListView({super.key,required this.image,required this.title,required this.isFavorite,required this.addToFav});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(constants.base_url+"$image"),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$title",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                  GestureDetector(
                    onTap:addToFav ,
                      child: Icon(Icons.star,color: isFavorite ?Colors.amber:Colors.grey))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
