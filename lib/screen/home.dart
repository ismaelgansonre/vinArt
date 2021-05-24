import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vin/tabs/Fav_tab.dart';
import 'package:vin/tabs/home_tab.dart';
import 'package:vin/tabs/recherche_tab.dart';
import 'package:vin/widgets/barnavigation.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      Expanded(
      child: PageView(
      controller : _tabsPageController,
          onPageChanged: (num) {
            setState(() {
              _selectedTab = num;
            });
          },
          children: [
     //HomeTab se trouve dans le dossier tabs
        HomeTab(),
            FavorisTab(),
            RechercheTab(),
]
    ),
    ),


    Barnavigation(
    selectedTab: _selectedTab,
    tabPressed: (num){
    _tabsPageController.animateToPage(num,duration:Duration(milliseconds :300),
        curve:Curves.easeInCubic );

    },

    )
    , //appel la fonction qui se trouve dans barnavigation
    ]
    ,
    )
    );
  }
}
