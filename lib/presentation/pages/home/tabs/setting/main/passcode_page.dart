import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/passcode_screen.dart';

class PassCodePage extends StatefulWidget {
  @override
  _PassCodePageState createState() => _PassCodePageState();
}

class _PassCodePageState extends State<PassCodePage> {
  int index = 4;
  String enteredPasscode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Colors.orange[200],
                Colors.orange[300],
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
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
                    ],
                  ),
                ),
              ),
              Text(
                "Enter Passcode",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildCircles(),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildItemNumberCircle(1),
                        _buildItemNumberCircle(2),
                        _buildItemNumberCircle(3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildItemNumberCircle(4),
                        _buildItemNumberCircle(5),
                        _buildItemNumberCircle(6),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildItemNumberCircle(7),
                        _buildItemNumberCircle(8),
                        _buildItemNumberCircle(9),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const SizedBox(width: 50),
                        _buildItemNumberCircle(0),
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.backspace),
                              iconSize: 35,
                              splashColor: Colors.grey,
                              color: Colors.black45,
                              onPressed: () {
                                if (enteredPasscode.length > 0) {
                                  setState(() {
                                    enteredPasscode = enteredPasscode.substring(
                                        0, enteredPasscode.length - 1);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
 Widget _buildItemNumberCircle(int number) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1.3),
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () {
              setState(() {
                if (enteredPasscode.length < 4) {
                  enteredPasscode += number.toString();
                }
              });
            },
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(
        Circle(
          filled: i < enteredPasscode.length,
          circleUIConfig: CircleUIConfig(fillColor: Colors.orange[600],borderColor: Colors.black),
        ),
      );
    }
    return list;
  }
}
