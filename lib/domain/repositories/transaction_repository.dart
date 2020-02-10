import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getAll();
  Future<TransactionEntity> getTransactionById(int id);
  Future<bool> createTransaction(TransactionEntity data);
  Future<bool> deleteTransaction(TransactionEntity data);
  Future<bool> updateTransaction(TransactionEntity data);
}
