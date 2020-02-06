import 'package:flutter/material.dart';
import 'package:money_manager/presentation/pages/dashboard.dart';
import 'package:money_manager/presentation/pages/splash/onboardscreen.dart';
import 'package:money_manager/presentation/pages/splash/splashscreen.dart';


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


