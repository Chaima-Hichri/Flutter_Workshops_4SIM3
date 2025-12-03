import 'package:flutter/material.dart';
class  CustomDrawer extends StatelessWidget {
  const  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.png")),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/profile");
            },
            child: ListTile(
              leading:Icon(Icons.person),
              title: Text("Update Profile"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/");

            },
            child: ListTile(
              leading:Icon(Icons.logout),
              title: Text("logout"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/bottomnav");
            },
            child: ListTile(
              leading:Icon(Icons.arrow_forward_rounded),
              title: Text("go to navbar"),
            ),
          ),

        ],
      ),
    );
  }
}
