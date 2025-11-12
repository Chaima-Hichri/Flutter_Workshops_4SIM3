import 'package:flutter/material.dart';
import 'package:workshops_flutter_4sim3/Widgets/CardWidget.dart';
class GStore extends StatefulWidget {
  const GStore({super.key});

  @override
  State<GStore> createState() => _GStoreState();
}

class _GStoreState extends State<GStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("G-STORE",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          CardWidget(image: "HouseOfDead.jpg", title: "House Of Dead"),
          CardWidget(image: "iceroad.jpg", title: "Ice Road"),
          CardWidget(image: "theabyss.jpg", title: "The Abyss"),
          CardWidget(image: "thegrudge.jpg", title: "The Grudge"),

          ],
        ),
      ),
    );
  }
}
