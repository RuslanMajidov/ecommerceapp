import 'dart:async';
import 'package:bloc/bloc.dart';
import '/repositories/category/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(
      LoadCategories event,
      Emitter<CategoryState> emit,
      ) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getallCategories().listen(
          (products) => add(
        UpdateCategories(products),
      ),
    );
  }

  void _onUpdateCategories(
      UpdateCategories event,
      Emitter<CategoryState> emit,
      ) {
    emit(
      CategoryLoaded(categories: event.categories),
    );
  }
}