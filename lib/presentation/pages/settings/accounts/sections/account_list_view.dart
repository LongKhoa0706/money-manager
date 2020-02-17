import 'package:flutter/material.dart';
import 'package:money_manager/domain/entities/account_entity.dart';

class AccountListView extends StatelessWidget {
  /// Create a AccountListView widget.
  AccountListView({
    Key key,
    @required this.items,
  }): assert(items != null),
      super(key: key);

  final List<AccountEntity> items;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AccountListTile(
          data: items.elementAt(index),
        );
      }
    );
  }
}

class AccountListTile extends StatelessWidget {
  /// Create a AccountListTile widget.
  AccountListTile({
    Key key,
    @required this.data,
  }): assert(data != null),
      super(key: key);

  final AccountEntity data;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
