import 'package:flutter/material.dart';

class ExpenseTab extends StatelessWidget {
  /// Create a ExpenseTab widget.
  ExpenseTab({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Expense Categories'),
      ),
    );
  }
}
