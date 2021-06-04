import 'package:vin/constant.dart';
import 'package:vin/widgets/custom_nav_bar.dart';
import 'package:vin/widgets/image_swipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("Produits");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                // Firebase Document Data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                // List of images
                List imageList = documentData["images"];

                return ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ImageSwipe(imageList: imageList,),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        "${documentData['name']}",
                        style: Constant.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "${documentData['prix']} \CFA",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "${documentData['description']}",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Select Capacity",
                        style: Constant.regularDarkText,
                      ),
                    ),
                  ],
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            flecheDeRetour: true,
            asUnTitre: false,
            hasBack: false,
          )
        ],
      ),
    );
  }
}