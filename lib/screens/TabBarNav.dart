import 'package:flutter/material.dart';
import 'package:workshops_flutter_4sim3/Widgets/CustomDrawer.dart';
import 'package:workshops_flutter_4sim3/screens/Favorites.dart';
import 'package:workshops_flutter_4sim3/screens/MyCart.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsGridView.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsListView.dart';
class TabBarNav extends StatefulWidget {
  const TabBarNav({super.key});

  @override
  State<TabBarNav> createState() => _TabBarNavState();
}

class _TabBarNavState extends State<TabBarNav> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("G-Store"),
        bottom: TabBar(
          controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.list_alt_outlined),text: "My Films",),
              Tab(icon: Icon(Icons.list),text: "Ma bibliotheque",),
              Tab(icon: Icon(Icons.shopping_basket),text: "Basket",),
              Tab(icon: Icon(Icons.favorite),text: "Favorites",),
            ]),


      ),
      body: TabBarView(
        controller: tabController,
          children: [
            MyFilmsListView(),
            MyFilsGridView(),
            MyCart(),
            Favorites()

      ]),

    );
  }
}
