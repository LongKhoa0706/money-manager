import 'package:flutter/widgets.dart';
import 'package:money_manager/core/contracts/entity.dart';

class AccountEntity implements Entity<AccountEntity> {
  AccountEntity({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.balance,
    @required this.icon,
    @required this.createdDate,
  }): assert(title != null),
      assert(title.isNotEmpty),
      assert(balance != null),
      assert(createdDate != null);

  final int id;
  final String title;
  final String description;
  final double balance;
  final IconData icon;
  final DateTime createdDate;

  @override
  AccountEntity copyWith({
    String title,
    String description,
    double balance,
    IconData icon,
  }) {
    if (description != null) {
      description = description.isNotEmpty ? description : null;
    } else {
      description = this.description;
    }

    return AccountEntity(
      id: this.id,
      title: title ?? this.title,
      description: description,
      balance: balance ?? this.balance,
      icon: icon ?? icon,
      createdDate: this.createdDate,
    );
  }

  @override
  int get hashCode {
    return id.hashCode
         ^ title.hashCode
         ^ description.hashCode
         ^ balance.hashCode
         ^ icon.hashCode
         ^ createdDate.hashCode;
  }

  @override
  bool operator == (object) {
    return identical(this, object)
        || object is AccountEntity
        && id == object.id
        && title == object.title
        && description == object.description
        && balance == object.balance
        && icon == object.icon
        && createdDate == object.createdDate;
  }
}
