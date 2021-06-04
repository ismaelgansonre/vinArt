import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vin/constant.dart';
import 'package:vin/screen/produits.dart';
import 'package:vin/widgets/custom_nav_bar.dart';

class HomeTab extends StatelessWidget {
final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Produits");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error:${snapshot.error}"),
                  ),
                );
              }
              // Collection Data ready to display
              if(snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 108.0,
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    
                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> ProductPage(productId:document.id,),
                        ));
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 350.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 350.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  "${document.data()["images"][0]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(document.data()["name"]??"Nom du produits",
                                    style: Constant.regularHeading,),
                                    Text(
                                     " ${document.data()["prix"]}\CFA" ??"Prix",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w600
                                    ),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

            },
          ),
         CustomActionBar(
           title: "Accueil",
           asUnTitre: true,
           flecheDeRetour: false,
         ),
        ],
      ),
    );
  }
}
