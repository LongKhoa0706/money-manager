import 'package:flutter/material.dart';

import 'package:money_manager/domain/entities/transaction_entity.dart';
import 'package:money_manager/domain/entities/account_entity.dart';

import 'recent_controller.dart';
import 'sections/transaction_list_view.dart';

class RecentTab extends StatefulWidget {
  /// Create a RecentTab widget.
  RecentTab({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  RecentController controller;

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    controller = RecentController();
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(RecentTab old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Build the widget with this state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.orange[300],
              Colors.orange[400],
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    StreamBuilder<List<AccountEntity>>(
                      stream: controller.accounts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          double total = 0;
                          for (var account in snapshot.data) {
                            total += account.balance;
                          }

                          return Text(
                            total.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 34,
                            ),
                          );
                        }
                      },
                    ),
                  ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Recent Transaction',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            Chip(
                              label: Text('See all'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TransactionListView(
                          data: Map<DateTime, List<TransactionEntity>>(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[400],
        onPressed: () {
          // TODO: Handle click add button.
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
