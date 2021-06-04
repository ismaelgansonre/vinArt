import 'package:flutter/cupertino.dart';
import 'package:vin/widgets/custom_nav_bar.dart';

class FavorisTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Favoris "),
          ),
          CustomActionBar(
            title: "Favoris",
            asUnTitre: true,
            flecheDeRetour: false,
          ),
        ],
      ),
    );
  }
}
