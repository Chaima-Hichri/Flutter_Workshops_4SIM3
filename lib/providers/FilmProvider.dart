import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workshops_flutter_4sim3/constants/constants.dart';
import '../entities/Film.dart';

class FilmProvider with ChangeNotifier{
  List<Film> _films=[];

  bool _isLoading =false;
  bool get isLoading =>_isLoading;
  List<Film> get films =>_films;


  Future<void> fetchFilms() async{
    _isLoading=true;
    notifyListeners();

    try{
      final response = await http.get(
        Uri.parse(constants.base_url+"/movies")
      );
      if(response.statusCode==200){
        List<dynamic> filmsFromserver =json.decode(response.body);
        _films= filmsFromserver.map(
                (item)=>Film(
                    item['title'],
                    item['image'],
                    item['description'],
                    item['price'])

        ).toList();
      }
     // notifyListeners();

    }
    catch(e){
      print( e);
    }

    finally{
      _isLoading=false;
      notifyListeners();
    }

  }

}