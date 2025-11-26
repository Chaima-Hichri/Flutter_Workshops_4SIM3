import 'package:flutter/material.dart';

import '../entities/Film.dart';
class Details extends StatefulWidget {
  final Film film;
  const Details({super.key,required this.film});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(widget.film.image),
            SizedBox(height: 20,),
            Text(widget.film.description),
            SizedBox(height: 20,),

            Text(widget.film.price.toString()+" DT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
            SizedBox(height: 40,),

            Container(
              width: 130,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.shopping_basket),
                      Text("Acheter")
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
