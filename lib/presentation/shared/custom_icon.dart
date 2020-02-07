import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;

  const CustomIcon({Key key, @required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: Colors.deepOrange[400],
      ),
    );
  }
}
