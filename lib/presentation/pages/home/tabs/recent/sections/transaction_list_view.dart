import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/domain/entities/transaction_entity.dart';

class TransactionListView extends StatelessWidget {
  /// Create a TransactionListView widget.
  TransactionListView({
    Key key,
    @required this.data,
  }): assert(data != null),
      super(key: key);

  final Map<DateTime, List<TransactionEntity>> data;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GroupTransactionListTile(
          date: data.keys.elementAt(index),
          items: data.values.elementAt(index),
        );
      },
    );
  }
}

class GroupTransactionListTile extends StatelessWidget {
  /// Create a GroupTransactionListTile widget.
  GroupTransactionListTile({
    Key key,
    @required this.date,
    @required this.items,
  }): super(key: key);

  final DateTime date;
  final List<TransactionEntity> items;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    double totalIncome = 0;
    double totalExpense = 0;

    items.forEach((data) {
      children.add(
        TransactionListTile(data: data),
      );
    });

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(2.4, 2),
              blurRadius: 4,
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
            DateFormat.yMMMd().format(date),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Income: $totalIncome',
              ),
              Text(
                'Expense: $totalExpense',
              ),
            ],
          ),
          children: children,
        ),
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  /// Create a TransactionListTile widget.
  TransactionListTile({
    Key key,
    @required this.data
  }): assert(data != null),
      super(key: key);

  final TransactionEntity data;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    Color color = Colors.green;
    // if (data.category.type == CategoryType.EXPENSE) {
    //   color = Colors.red;
    // }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffc2c3c4).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.home,
              color: color,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              data.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 120,
            child: Text(
              data.amount.toStringAsFixed(2),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
