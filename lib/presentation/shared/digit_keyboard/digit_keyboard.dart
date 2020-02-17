import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DigitKeyboard extends StatelessWidget {
  /// Create a DigitKeyboard widget.
  DigitKeyboard({
    Key key,
    @required this.onPressed,
    @required this.onDeletePressed,
  }): assert(onPressed != null),
      assert(onDeletePressed != null),
      super(key: key);

  final ValueChanged<String> onPressed;
  final VoidCallback onDeletePressed;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildDigitKey(1),
            buildDigitKey(2),
            buildDigitKey(3),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildDigitKey(4),
            buildDigitKey(5),
            buildDigitKey(6),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildDigitKey(7),
            buildDigitKey(8),
            buildDigitKey(9),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 64,
              height: 64,
            ),
            buildDigitKey(0),
            buildDeleteKey(),
          ],
        ),
      ],
    );
  }

  Widget buildDigitKey(int value) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: () {
          onPressed(value.toString());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 64,
          width: 64,
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDeleteKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: onDeletePressed,
        child: Container(
          height: 64,
          width: 64,
          child: Icon(FontAwesomeIcons.backspace),
        ),
      ),
    );
  }
}
