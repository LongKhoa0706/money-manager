import 'package:flutter/material.dart';

class CustomFloatAction extends StatelessWidget {
  /// Create a CustomFloatAction widget.
  CustomFloatAction({
    Key key,
    @required this.child,
    this.onPressed,
  }): assert(child != null),
      super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
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
        elevation: 0,
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
