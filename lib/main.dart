import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workshops_flutter_4sim3/entities/Film.dart';
import 'package:workshops_flutter_4sim3/screens/BottomNavBar.dart';
import 'package:workshops_flutter_4sim3/screens/Details.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsGridView.dart';
import 'package:workshops_flutter_4sim3/screens/MyFilmsListView.dart';
import 'package:workshops_flutter_4sim3/screens/Profile.dart';
import 'package:workshops_flutter_4sim3/screens/SignIn.dart';
import 'package:workshops_flutter_4sim3/screens/SignUp.dart';
import 'package:workshops_flutter_4sim3/screens/TabBarNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FilmAdapter());
  await Hive.openBox<Film>('favorites');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/filmsListView': (context) => const MyFilmsListView(),
        '/filmsgridView': (context) => const MyFilsGridView(),
        '/profile': (context) => const Profile(),
        '/bottomnav': (context) => const BottomNavBar(),
        '/tabBarNav': (context) => const TabBarNav(),
      },
    );
  }
}

