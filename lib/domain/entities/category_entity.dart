import 'package:flutter/widgets.dart';
import 'package:money_manager/core/contracts/entity.dart';

enum CATEGORY_TYPE {
  INCOME,
  EXPENSE,
}

class CategoryEntity implements Entity<CategoryEntity> {
  CategoryEntity({
    @required this.id,
    @required this.title,
    @required this.type,
    @required this.icon,
  });

  final int id;
  final String title;
  final CATEGORY_TYPE type;
  final IconData icon;

  @override
  CategoryEntity copyWith({
    String title,
    CATEGORY_TYPE type,
    IconData icon,
  }) {
    return CategoryEntity(
      id: this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      icon: icon ?? this.icon,
    );
  }

  @override
  int get hashCode {
    return id.hashCode
         ^ title.hashCode
         ^ type.hashCode
         ^ icon.hashCode;
  }

  @override
  bool operator == (object) {
    return identical(this, object)
        || object is CategoryEntity
        && id == object.id
        && title == object.title
        && type == object.type
        && icon == object.icon;
  }
}
