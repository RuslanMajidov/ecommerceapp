import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/models/category_models.dart';
import 'package:ecommerceapp/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository{
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
  : _firebaseFirestore = _firebaseFirestore?? FirebaseFirestore.instance;


  @override
  Stream<List<Category>> getallCategories() {
  return _firebaseFirestore.collection('categories').snapshots().map((snapshot){
  return snapshot.docs.map((docs)=> Category.fromSnapshot(doc)).toList();
  });
  }

}