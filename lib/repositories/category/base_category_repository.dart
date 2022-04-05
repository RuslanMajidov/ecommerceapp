import 'package:ecommerceapp/models/category_models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getallCategories();
}