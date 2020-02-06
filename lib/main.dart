import 'package:flutter/material.dart';
import 'package:money_manager/page/dashboard.dart';
import 'package:money_manager/page/onboardscreen.dart';

import 'package:money_manager/page/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings setting){
        switch(setting.name){
          case '/':
            return MaterialPageRoute(builder: (context)=> SplashScreen());
          case '/onboardscreen':
            return MaterialPageRoute(builder: (context)=> OnBoardScreen());
          case '/homescreen':
            return MaterialPageRoute(builder: (context)=> DashBoard());

        }
      },
      onUnknownRoute: (RouteSettings setting){
        return MaterialPageRoute(builder: (_)=>Text("Round name does not exist"));
      },
    );
  }
}

