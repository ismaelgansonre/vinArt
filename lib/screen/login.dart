import 'package:flutter/material.dart';
import 'package:vin/screen/registration.dart';
import 'package:vin/widgets/custom_btn.dart';
import 'package:vin/widgets/custom_input.dart';

import '../constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child: Text(
                  "Welcome User \n Connecte toi",
                  textAlign: TextAlign.center,
                  style: Constant.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Adresse e-mail",
                  ),
                  CustomInput(
                    hintText: "Mot de passe",
                  ),
                  CustomBtn(
                    text: "Connexion",
                    onPressed: () {
                      print("Presse pour se connecter");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBtn(
                  text: "Creation du Nouveau compte",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  outlineBtn: true,
                ),
              ),
            ],
            // style :Constant.regularHeading
          ),
        ),
      ),
    );
  }
}
