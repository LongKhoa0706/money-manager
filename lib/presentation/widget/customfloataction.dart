import 'package:flutter/material.dart';

class CustomFloatAction extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const CustomFloatAction({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(5.0,5.0),
              blurRadius: 10
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.deepOrange[200],
            Colors.orange[300],
          ],
        ),
      ),
      child: Material(
        elevation: 0.0,
        color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),

        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
