import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FormKeyBoard extends StatefulWidget {
  final Function onPress;
  final Function onDelete;

  const FormKeyBoard({Key key, this.onPress, this.onDelete}) : super(key: key);

  @override
  _FormKeyBoardState createState() => _FormKeyBoardState();
}

class _FormKeyBoardState extends State<FormKeyBoard> {
  final dateFormat = DateFormat('dd-MM-yyyy');
  DateTime selectedDate = DateTime.now();
  String dateTime = '';

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildNumber(7),
            buildNumber(8),
            buildNumber(9),
            Container(
              height: 50,
              width: 80,
              child: GestureDetector(
                  onTap: () =>_selectDate(context),
                  child: Center(child: Text(dateTime.isEmpty ? "Date" : dateTime))),
            ),
          ],
        ),
        Divider(color: Colors.grey,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildNumber(4),
            buildNumber(5),
            buildNumber(6),
            buildPlusKey(),
          ],
        ),
        Divider(color: Colors.grey,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildNumber(1),
            buildNumber(2),
            buildNumber(3),
            buildMinusKey(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(
              width: 70,
            ),
            buildNumber(0),
            buildDeleteKey(),
            buildTotalKey(),
          ],
        ),
      ],
    );
  }

  Widget buildNumber(int value){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey[200],
        onTap: (){
          widget.onPress(value.toString());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 50,
          width: 50,
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: const Color(0xFFFFA726),
                accentColor: const Color(0xFFFFA726)
            ),
            child: child,
          );
        },
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateTime = dateFormat.format(picked);
      });
  }
  Widget buildPlusKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: (){
          // Todo
        },
        child: Container(
          height: 64,
          width: 64,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildMinusKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: (){
          // Todo
        },
        child: Container(
          height: 64,
          width: 64,
          child: Icon(FontAwesomeIcons.minus,size: 18,),
        ),
      ),
    );
  }

  Widget buildDeleteKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: (){
          // Todo
        },
        child: Container(
          height: 64,
          width: 64,
          child: Icon(FontAwesomeIcons.backspace,size: 18,),
        ),
      ),
    );
  }

  Widget buildTotalKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(64),
        onTap: (){
          // Todo
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.orange[300],
                Colors.orange[400],
              ],
            ),
          ),
          child: Icon(FontAwesomeIcons.checkCircle,size: 23,),
        ),
      ),
    );
  }
}

