import 'package:flutter/widgets.dart';
import 'package:money_manager/domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel({
    int id,
    @required String title,
    @required double balance,
    @required IconData icon,
    @required DateTime createdDate,
    String description,
  }): super(
    id: id,
    title: title,
    description: description,
    balance: balance,
    icon: icon,
    createdDate: createdDate,
  );

  factory AccountModel.fromMap(Map<String, dynamic> data) {
    return AccountModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      balance: data['balance'],
      icon: IconData(data['icon']),
      createdDate: DateTime.fromMillisecondsSinceEpoch(data['created_date']),
    );
  }
}
