import 'package:flutter/material.dart';
import 'package:workshops_flutter_4sim3/Widgets/CustomDrawer.dart';
import 'package:workshops_flutter_4sim3/screens/MyCart.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsGridView.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsListView.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex=0;
  List<Widget> interfaces =[MyFilmsListView(),MyFilsGridView(),MyCart()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
          onTap: (value){
          setState(() {
            pageIndex=value;

          });
          },
          
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Store"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined),label: "Bibliotheque"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "Basket"),
          ]),
      body: interfaces[pageIndex],
    );
  }
}
