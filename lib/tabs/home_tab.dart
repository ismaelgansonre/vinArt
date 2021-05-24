import 'package:flutter/cupertino.dart';
import 'package:vin/widgets/custom_nav_bar.dart';

class HomeTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Acceuil Page"),
          ),
         CustomActionBar(),
        ],
      ),
    );
  }
}
