import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vin/widgets/barnavigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Center(
            child : Text(
              "Accueil"
            ),
          ),
        ),

      Barnavigation(),//appel la fonction qui se trouve dans barnavigation
      ],
    ));
  }
}
