import 'package:meta/meta.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/models/transaction_model.dart';
import 'package:money_manager/domain/entities/transaction_entity.dart';
import 'package:money_manager/domain/repositories/transaction_repository.dart';

class ImplTransactionRepository implements TransactionRepository {
  ImplTransactionRepository({
    @required this.localDataSource,
  });

  final LocalDataSource localDataSource;
  final String table = 'Transaction';

  @override
  Future<List<TransactionEntity>> getAll() async {
    var db = await localDataSource.database;
    var items = await db.query(table);
    var result = List<TransactionEntity>();

    for (var item in items) {
      result.add(TransactionModel.from(item));
    }

    return result;
  }

  @override
  Future<TransactionEntity> getTransactionById(int id) async {
    var db = await localDataSource.database;
    var items = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (items.isNotEmpty) {
      return TransactionModel.from(items.elementAt(0));
    }

    return null;
  }

  @override
  Future<bool> createTransaction(TransactionEntity data) async {
    var db = await localDataSource.database;
    var result = await db.insert(table, entityToMap(data));
    return result < 0;
  }

  @override
  Future<bool> deleteTransaction(TransactionEntity data) async {
    var db = await localDataSource.database;
    var result = await db.delete(table, where: 'id = ?', whereArgs: [data.id]);
    return result < 0;
  }

  @override
  Future<bool> updateTransaction(TransactionEntity data) async {
    var db = await localDataSource.database;
    var result = await db.update(
      table,
      entityToMap(data),
      where: 'id = ?',
      whereArgs: [data.id],
    );

    return result < 0;
  }

  Map<String, dynamic> entityToMap(TransactionEntity data) {
    return <String, dynamic>{
      'id': data.id,
      'category_id': data.categoryId,
      'title': data.title,
      'amount': data.amount,
      'created_date': data.createdDate.millisecondsSinceEpoch,
      'updated_date': data.updatedDate.millisecondsSinceEpoch,
    };
  }
}
