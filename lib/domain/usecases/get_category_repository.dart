import 'package:money_manager/core/contracts/usecase.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/repositories/impl_category_repository.dart';
import 'package:money_manager/domain/repositories/category_repository.dart';

class GetCategoryRepository implements UseCase<CategoryRepository> {
  CategoryRepository get() {
    return ImplCategoryRepository(localDataSource: LocalDataSource());
  }
}
