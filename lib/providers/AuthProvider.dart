import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:workshops_flutter_4sim3/constants/constants.dart';

class Authprovider with ChangeNotifier {
  bool _isLoading=false;
  bool get isLoading =>_isLoading;

  Future<bool> signIn(String email,String password) async{
    _isLoading=true;
    notifyListeners();

    Map<String,String> headers={
      "Content-Type":"application/json; charset=UTF-8"
    };

    Map<String,dynamic> userData={

      "email": email,
      "password": password
    };
    try{
      final response = await http.post(
        Uri.parse(constants.base_url+"/signin"),
        headers: headers,
        body: json.encode(userData)

      );
      _isLoading=false;
      notifyListeners();

      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }

    }
    catch(e){

      _isLoading=false;
      notifyListeners();
      print(e);
      return false;
    }
  }


  Future<bool> signUp(String username, String email,String password) async{
    _isLoading=true;
    notifyListeners();
    Map<String,String> headers={
      "Content-Type":"application/json; charset=UTF-8"
    };

    Map<String,dynamic> userData={
      "username": username,
      "email": email,
      "password": password
    };
    try{
      final response = await http.post(
          Uri.parse(constants.base_url+"/signup"),
          headers: headers,
          body: json.encode(userData)

      );
      _isLoading=false;
      notifyListeners();

     return response.statusCode==201;

    }
    catch(e){

      _isLoading=false;
      notifyListeners();
      print(e);
      return false;
    }
  }



}