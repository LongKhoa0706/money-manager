import 'package:flutter/widgets.dart';
import 'package:money_manager/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    int id,
    @required String title,
    @required CATEGORY_TYPE type,
    @required IconData icon,
  }): super(
    id: id,
    title: title,
    type: type,
    icon: icon,
  );

  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id'],
      title: data['title'],
      type: data['type'] == 'income'
            ? CATEGORY_TYPE.INCOME
            : CATEGORY_TYPE.EXPENSE,
      icon: IconData(data['icon']),
    );
  }
}
