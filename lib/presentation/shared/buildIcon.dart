import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final int  index;
  final int selectIndex;

  const BuildIcon({Key key, this.icon, this.title, this.index, this.selectIndex}) : super(key: key);


  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
            border: Border.all(width: 1.5,color: selectIndex == index ? Colors.orange : Colors.grey[200] ),
          ),
          child: Icon(icon),
        ),
        Text(title),
      ],
    );
  }
}
