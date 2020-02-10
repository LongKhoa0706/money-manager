import 'package:money_manager/core/contracts/usecase.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/repositories/impl_account_repository.dart';
import 'package:money_manager/domain/repositories/account_repository.dart';

class GetAccountRepository implements UseCase<AccountRepository> {
  AccountRepository get() {
    return ImplAccountRepository(localSource: LocalDataSource());
  }
}
