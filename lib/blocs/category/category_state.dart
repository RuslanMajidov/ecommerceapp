import 'package:equatable/equatable.dart';

import '../../models/category_models.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  const CategoryLoaded({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories];
}
