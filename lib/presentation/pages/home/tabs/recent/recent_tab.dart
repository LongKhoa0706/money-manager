import 'package:flutter/material.dart';
import 'package:money_manager/presentation/shared/custom_float_action.dart';

class RecentTab extends StatelessWidget {
  /// Create a RecentTab widget.
  RecentTab({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.orange[200],
                  Colors.orange[400],
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total Spend Money',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '\$5000',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Placeholder(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomFloatAction(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
