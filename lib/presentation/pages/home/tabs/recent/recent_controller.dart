import 'dart:async';

import 'package:money_manager/core/contracts/controller.dart';
import 'package:money_manager/domain/entities/account_entity.dart';
import 'package:money_manager/domain/usecases/get_account_repository.dart';

class RecentController implements Controller {
  RecentController() {
    _fetchAllAccount();
  }

  final _accountRepository = GetAccountRepository().get();
  final _accountsSubject = StreamController<List<AccountEntity>>.broadcast();
  Stream<List<AccountEntity>> get accounts => _accountsSubject.stream;

  List<AccountEntity> _accounts = <AccountEntity>[];

  void _fetchAllAccount() {
    _accountRepository.getAll().then((listAccounts) {
      _accounts = listAccounts;
      _accountsSubject.add(_accounts);
    });
  }

  @override
  void dispose() {
    _accountsSubject.close();
  }
}
