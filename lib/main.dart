import 'package:e_katalog/katalog/homeapi.dart';
import 'package:flutter/material.dart';
import 'crud/create.dart';
import 'crud/crud.dart';
import 'crud/home.dart';
import 'crud/update.dart';
import 'katalog/profil.dart';
import 'login/login.dart';
import 'login/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/signin": (context) => SigninPage(),
        "/crud": (context) => const MyCRUD(title: 'crud',),
        "/home": (context) => const HomePage(title: 'grid',),
        "/update": (context) => const UpdateProduk(),
        "/create": (context) => const CreateProduk(),
        "/user": (context) => const ProfilePage(),
        "/api": (context) => const HomePageApi(title: 'api',),
      },
    );
  }
}
