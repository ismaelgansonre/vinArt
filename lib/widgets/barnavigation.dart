import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Barnavigation extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  Barnavigation({this.selectedTab, this.tabPressed});

  @override
  _BarnavigationState createState() => _BarnavigationState();
}

class _BarnavigationState extends State<Barnavigation> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Container(
        //l'ombre arriere plan du bouton de navigation
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1.0,
                blurRadius: 30.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoutonNavigation(
              imagePath: "assets/img/tab_home.png",
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabPressed(0);
                });
              },
            ),
            BoutonNavigation(
                imagePath: 'assets/img/tab_saved.png',
                selected: _selectedTab == 1 ? true : false,
                onPressed: () {
                  setState(() {
                    widget.tabPressed(1);
                  });
                }),
            BoutonNavigation(
                imagePath: 'assets/img/tab_search.png',
                selected: _selectedTab == 2 ? true : false,
                onPressed: () {
                  setState(() {
                    widget.tabPressed(2);
                  });
                }),
            BoutonNavigation(
                imagePath: 'assets/img/tab_logout.png',
                selected: _selectedTab == 3 ? true : false,
                onPressed: () {
                  setState(() {
                    widget.tabPressed(3);
                  });
                }),
          ],
        ));
  }
}

class BoutonNavigation extends StatelessWidget {
  final Function onPressed;
  final String imagePath;
  final bool selected;

  BoutonNavigation({this.imagePath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected ? Theme.of(context).accentColor : Colors.transparent,
        ))),
        child: Image(
          image: AssetImage(
            imagePath ?? "assets/img/tab_home.png",
          ),
          //taille des images (boutons)
          width: 26.0,
          height: 26.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
