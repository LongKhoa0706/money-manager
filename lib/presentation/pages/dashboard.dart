import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/presentation/pages/chart/chart_page.dart';
import 'package:money_manager/presentation/pages/save/save_page.dart';
import 'package:money_manager/presentation/pages/spend/spend_page.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;
  List<Widget> listScreen = [
    SpendScreen(),
    SaveScreen(),
    ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        elevation: 0.0,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange[300],
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildItemBottomNavigation(FontAwesomeIcons.creditCard, "Spend"),
          _buildItemBottomNavigation(FontAwesomeIcons.heart, "Save"),
          _buildItemBottomNavigation(FontAwesomeIcons.chartPie, "Chart"),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: listScreen,
      ),
    );
  }
  _buildItemBottomNavigation(IconData icon,String title){
    return BottomNavigationBarItem(
      icon: Icon(icon,size: 20,),
      title: Text(title),
    );
  }
}
