
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vin/package/firebase_services.dart';
import 'package:vin/screen/produits.dart';
import 'package:vin/widgets/custom_nav_bar.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          CustomActionBar(
            hasBack: true,
            title: "Panier",
          )
        ],
      ),
    );
  }
}
