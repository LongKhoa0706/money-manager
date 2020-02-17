import 'package:flutter/material.dart';
import 'package:money_manager/domain/entities/account_entity.dart';

import 'sections/account_list_view.dart';

class AccountsPage extends StatelessWidget {
  /// Create a AccountsPage widget.
  AccountsPage({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<List<AccountEntity>>(
              // stream: controller.accountsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
