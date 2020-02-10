import 'package:money_manager/core/contracts/usecase.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/repositories/impl_transaction_repository.dart';
import 'package:money_manager/domain/repositories/transaction_repository.dart';

class GetTransactionRepository implements UseCase<TransactionRepository> {
  TransactionRepository get() {
    return ImplTransactionRepository(localDataSource: LocalDataSource());
  }
}
