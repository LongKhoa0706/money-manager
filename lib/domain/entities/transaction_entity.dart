import 'package:meta/meta.dart';
import 'package:money_manager/core/contracts/entity.dart';

class TransactionEntity implements Entity<TransactionEntity> {
  TransactionEntity({
    @required this.id,
    @required this.accountId,
    @required this.categoryId,
    @required this.title,
    @required this.amount,
    @required this.createdDate,
    @required this.updatedDate,
  }): assert(accountId != null),
      assert(categoryId != null),
      assert(title != null),
      assert(amount != null),
      assert(createdDate != null),
      assert(updatedDate != null);

  final int id;
  final int accountId;
  final int categoryId;
  final String title;
  final double amount;
  final DateTime createdDate;
  final DateTime updatedDate;

  @override
  TransactionEntity copyWith({
    String title,
    double amount,
    int accountId,
    int categoryId,
    DateTime updatedDate,
  }) {
    return TransactionEntity(
      id: this.id,
      accountId: accountId ?? this.accountId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      categoryId: categoryId ?? this.categoryId,
      createdDate: this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  int get hashCode {
    return id.hashCode
         ^ accountId.hashCode
         ^ title.hashCode
         ^ amount.hashCode
         ^ categoryId.hashCode
         ^ createdDate.hashCode
         ^ updatedDate.hashCode;
  }

  @override
  bool operator == (object) {
    return identical(this, object)
        || object is TransactionEntity
        && id == object.id
        && accountId == object.accountId
        && title == object.title
        && amount == object.amount
        && categoryId == object.categoryId
        && createdDate == object.createdDate
        && updatedDate == object.updatedDate;
  }
}
