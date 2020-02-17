import 'package:flutter/material.dart';

class IncomeTab extends StatelessWidget {
  /// Create a IncomeTab widget.
  IncomeTab({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Income Categories'),
      ),
    );
  }
}
