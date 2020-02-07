import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  void startTime(){
    Timer(Duration(seconds: 2), ()=>Navigator.pushReplacementNamed(context, '/onboardscreen'));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(3,3),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3,-3),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: <Color>[
                      Colors.orange[300],
                      Colors.orange[600],
                    ])
                  ),
                  child: Image.asset('assets/image/iconmoney.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Money Manager",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
