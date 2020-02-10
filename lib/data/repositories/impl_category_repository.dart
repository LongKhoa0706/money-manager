import 'package:meta/meta.dart';
import 'package:money_manager/data/data_sources/local_data_source.dart';
import 'package:money_manager/data/models/category_model.dart';
import 'package:money_manager/domain/entities/category_entity.dart';
import 'package:money_manager/domain/repositories/category_repository.dart';

class ImplCategoryRepository implements CategoryRepository {
  ImplCategoryRepository({
    @required this.localDataSource,
  }): assert(localDataSource != null);

  final LocalDataSource localDataSource;
  final String table = 'Category';

  @override
  Future<List<CategoryEntity>> getAll() async {
    var db = await localDataSource.database;
    var items = await db.query(table);
    var result = <CategoryEntity>[];

    for (var item in items) {
      result.add(CategoryModel.fromMap(item));
    }

    return result;
  }

  @override
  Future<CategoryEntity> getCategoryById(int id) async {
    var db = await localDataSource.database;
    var result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return CategoryModel.fromMap(result.elementAt(0));
    }

    return null;
  }

  @override
  Future<bool> createCategory(CategoryEntity data) async {
    var db = await localDataSource.database;
    var result = await db.insert(table, entityToMap(data));
    return result > 0;
  }

  @override
  Future<bool> deleteCategory(CategoryEntity data) async {
    var db = await localDataSource.database;
    var result = await db.delete(table, where: 'id = ?', whereArgs: [data.id]);
    return result > 0;
  }

  @override
  Future<bool> updateCategory(CategoryEntity data) async {
    var db = await localDataSource.database;
    var result = await db.update(
      table,
      entityToMap(data),
      where: 'id = ?',
      whereArgs: [data.id],
    );

    return result > 0;
  }

  Map<String, dynamic> entityToMap(CategoryEntity data) {
    return <String, dynamic>{
      'id': data.id,
      'title': data.title,
      'type': data.type == CATEGORY_TYPE.INCOME
              ? 'income'
              : 'expense',
      'icon': data.icon.codePoint,
    };
  }
}
