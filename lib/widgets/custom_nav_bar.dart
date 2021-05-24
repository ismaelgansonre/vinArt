import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vin/constant.dart';

class CustomActionBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   return Container(
      padding: EdgeInsets.only(
        top: 86.0,
        left: 24.0,
        right: 24.0,
        bottom: 24.0,
      ),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      Text("Bar d'action",

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
        child: Text(
         "0",
          style: TextStyle(
    fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
     ),
        ),
      )
       ]
      ),
    );
  }
}
