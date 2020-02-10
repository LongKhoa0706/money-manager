import 'package:meta/meta.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/models/account_model.dart';
import 'package:money_manager/domain/entities/account_entity.dart';
import 'package:money_manager/domain/repositories/account_repository.dart';

class ImplAccountRepository implements AccountRepository {
  ImplAccountRepository({
    @required this.localSource,
  });

  final LocalDataSource localSource;
  final String table = 'Account';

  @override
  Future<List<AccountEntity>> getAll() async {
    var db = await localSource.database;
    var items = await db.query(table);
    var result = List<AccountEntity>();

    for (var item in items) {
      result.add(AccountModel.fromMap(item));
    }

    return result;
  }

  @override
  Future<AccountEntity> getAccountById(int id) async {
    var db = await localSource.database;
    var items = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (items.isNotEmpty) {
      return AccountModel.fromMap(items.elementAt(0));
    }

    return null;
  }

  @override
  Future<bool> createAccount(AccountEntity data) async {
    var db = await localSource.database;
    var result = await db.insert(table, entityToMap(data));

    return result > 0;
  }

  @override
  Future<bool> deleteAccount(AccountEntity data) async {
    var db = await localSource.database;
    var result = await db.delete(table, where: 'id = ?', whereArgs: [data.id]);

    return result > 0;
  }

  @override
  Future<bool> updateAccount(AccountEntity data) async {
    var db = await localSource.database;
    var result = await db.update(
      table,
      entityToMap(data),
      where: 'id = ?',
      whereArgs: [data.id],
    );

    return result > 0;
  }

  Map<String, dynamic> entityToMap(AccountEntity data) {
    return <String, dynamic>{
      'id': data.id,
      'title': data.title,
      'description': data.description,
      'balance': data.balance,
      'icon': data.icon.codePoint,
      'created_date': data.createdDate.millisecondsSinceEpoch,
    };
  }
}
