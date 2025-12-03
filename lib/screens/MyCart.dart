import 'package:flutter/material.dart';
import 'package:workshops_flutter_4sim3/databaseSqlFlite/Mydb.dart';

import '../Widgets/itemBasket.dart';
import '../entities/Film.dart';

class MyCart extends StatefulWidget {

  const MyCart({super.key});


  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final List<Film> films = const [
    const Film("The Grudge", "assets/images/thegrudge.jpg","The Grudge is a curse, born when someone dies in extreme rage or sorrow and lingers where the person dies. Those who encounter it will die, and the curse is ..",150),
    const Film("House Of Dead", "assets/images/HouseOfDead.jpg","The House of the Dead is a classic arcade light gun shooter series from Sega that features government agents fighting hordes of biologically engineered undead and mutants",300),
    const Film("The abyss", "assets/images/theabyss.jpg","An abyss is a deep, immeasurable, and unfathomable space, gulf, or void, which can be a literal chasm or a figurative concept representing a profound crisis, emotional low point, or overwhelming challenge",100),
  ];

  List<Map<String,dynamic>> filmsBasket=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshBasket();
  }

  void refreshBasket() async{
    filmsBasket= await Mydb.getItems();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: filmsBasket.isNotEmpty
          ?ListView.builder(
        itemCount: filmsBasket.length,
        itemBuilder: (context,index){
      return Itembasket(
          image: films[index].image,
          title: films[index].title,
        deleteItem: (){
            Mydb.removeItem(filmsBasket[index]["id"]);
            refreshBasket();
        },
      );
    })
          :Center(child: Text("Your basket is empty"),),



    );
  }
}