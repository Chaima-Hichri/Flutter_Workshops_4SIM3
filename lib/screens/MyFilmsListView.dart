import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:workshops_flutter_4sim3/Widgets/CustomDrawer.dart';
import 'package:workshops_flutter_4sim3/Widgets/itemListView.dart';
import 'package:workshops_flutter_4sim3/providers/FilmProvider.dart';
import 'package:workshops_flutter_4sim3/screens/Details.dart';

import '../entities/Film.dart';
class MyFilmsListView extends StatefulWidget {
  const MyFilmsListView({super.key});

  @override
  State<MyFilmsListView> createState() => _MyFilmsListViewState();
}

class _MyFilmsListViewState extends State<MyFilmsListView> {
  late Box<Film> favoriteBox;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<FilmProvider>(context,listen: false).fetchFilms();
    });
    favoriteBox = Hive.box<Film>('favorites');
  }

  bool isFavorite(Film film){
    return favoriteBox.values.any((f)=>f.title==film.title);
  }

 void toggleFavorite(Film film){
    if (isFavorite(film)){
      final key = favoriteBox.keys.firstWhere(((k)=>favoriteBox.get(k)!.title==film.title));
      favoriteBox.delete(key);
    }else{
      favoriteBox.add(film);
    }
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    final filmProvider =  Provider.of<FilmProvider>(context);
    return Scaffold(
      body: filmProvider.isLoading
        ?Center(child: CircularProgressIndicator(),)
      :ListView.builder(
         itemCount: filmProvider.films.length,
          itemBuilder: (context,index){
           Film film= filmProvider.films[index];
           return GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(film: film)));
             },
               child: itemListView(
                   image:film.image,
                   title: film.title,
                 isFavorite:isFavorite(film),
                  addToFav: (){
                    toggleFavorite(film);
                  }

               ));
          })
    );
  }
}
