import 'package:meta/meta.dart';
import 'package:money_manager/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    int id,
    @required int categoryId,
    @required String title,
    @required double amount,
    @required DateTime createdDate,
    @required DateTime updatedDate,
  }): super(
    id: id,
    categoryId: categoryId,
    title: title,
    amount: amount,
    createdDate: createdDate,
    updatedDate: updatedDate,
  );

  factory TransactionModel.from(Map<String, dynamic> data) {
    return TransactionModel(
      id: data['id'],
      categoryId: data['category_id'],
      title: data['title'],
      amount: data['amount'],
      createdDate: DateTime.fromMillisecondsSinceEpoch(data['created_date']),
      updatedDate: DateTime.fromMillisecondsSinceEpoch(data['updated_date']),
    );
  }
}
