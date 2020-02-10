import 'package:money_manager/domain/entities/account_entity.dart';

abstract class AccountRepository {
  Future<List<AccountEntity>> getAll();
  Future<AccountEntity> getAccountById(int id);
  Future<bool> createAccount(AccountEntity data);
  Future<bool> deleteAccount(AccountEntity data);
  Future<bool> updateAccount(AccountEntity data);
}
