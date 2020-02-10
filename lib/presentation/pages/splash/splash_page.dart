import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  /// Create a SplashPage widget.
  SplashPage({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => checkFirstScreen(),
    );
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(SplashPage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    super.dispose();
  }

  /// Build the widget with this state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                        offset: Offset(3, 3),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.orange[300],
                        Colors.orange[600],
                      ],
                    ),
                  ),
                  child: Image.asset('assets/image/iconmoney.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Money Manager',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future checkFirstScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool check = sharedPreferences.getBool('firstscreen') ?? false;
    if (check) {
      Navigator.of(context).pushReplacementNamed('/home');
    }else{
      await sharedPreferences.setBool('firstscreen', true);
      Navigator.of(context).pushReplacementNamed('/onboard');
    }
  }
}
