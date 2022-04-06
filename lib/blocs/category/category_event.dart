
import 'package:equatable/equatable.dart';

import '../../models/category_models.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<Category> categories;

  const UpdateCategories(this.categories);

  @override
  List<Object> get props => [categories];
}