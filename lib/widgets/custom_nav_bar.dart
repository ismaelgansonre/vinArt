import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vin/constant.dart';

class CustomActionBar extends StatelessWidget {
final String title;
final bool flecheDeRetour;
final bool asUnTitre;

  final bool hasBack;
CustomActionBar({this.title,this.flecheDeRetour,this.asUnTitre,this.hasBack});

  @override
  Widget build(BuildContext context) {
    bool _flecheDeRetour=flecheDeRetour ?? false;
    bool _asUnTitre = asUnTitre ?? true;
    bool _hasBack = hasBack ?? true;
    final CollectionReference _usersRef = FirebaseFirestore
        .instance
        .collection("Users");

    User _user = FirebaseAuth.instance.currentUser;
   return Container(
     decoration: BoxDecoration(
       gradient: _hasBack? LinearGradient(
         colors: [
           Colors.white,
           Colors.white.withOpacity(0),
         ],
         begin: Alignment(0,0),
         end:Alignment(0,1),
       ):null
     ),
      padding: EdgeInsets.only(
        top: 86.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
if(_flecheDeRetour)
       GestureDetector(
       onTap: () {
      Navigator.pop(context);
    },
    child: Container(
    width: 42.0,
    height: 42.0,
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(8.0),
    ),
    alignment: Alignment.center,
    child: Image(
    image: AssetImage(
    "assets/img/flecheDeRetour.png"
    ),
    color: Colors.white,
    width: 16.0,
    height: 16.0,
    ),
    ),
       ),

if(asUnTitre)
     Text(
       title ?? "Bar d'action",

      style: Constant.boldHeading,
      ),

      Container(
        width: 42.0,
        height: 42.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),

        ),
        alignment: Alignment.center,
    child: StreamBuilder(
    stream: _usersRef.doc(_user.uid).collection("Cart").snapshots(),
    builder: (context, snapshot) {
    int _totalItems = 0;

    if(snapshot.connectionState == ConnectionState.active) {
    List _documents = snapshot.data.docs;
    _totalItems = _documents.length;
    }

    return Text(
    "$_totalItems" ?? "0",
    style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    ),
    );
    },
    ),
      )
       ]
      ),
    );
  }
}
