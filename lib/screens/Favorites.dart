import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workshops_flutter_4sim3/Widgets/itemListView.dart';

import '../entities/Film.dart';
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late Box<Film> favoriteBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoriteBox = Hive.box<Film>('favorites');
  }

  void removeFilm(Film film){
      final key = favoriteBox.keys.firstWhere(((k)=>favoriteBox.get(k)!.title==film.title));
      favoriteBox.delete(key);

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    List<Film> favoriteFilms = favoriteBox.values.toList();
    return Scaffold(
   body:ListView.builder(
     itemCount: favoriteFilms.length,

       itemBuilder: (context,index){
        return itemListView(
            image: favoriteFilms[index].image,
            title: favoriteFilms[index].title,
            isFavorite: true,
            addToFav: (){
              removeFilm(favoriteFilms[index]);
            },
            );
       }),
    );
  }
}
