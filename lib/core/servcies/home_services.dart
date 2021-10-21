import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {

  final CollectionReference<Map<String, dynamic>> _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference<Map<String, dynamic>> _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

 Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCategory() async {
    QuerySnapshot<Map<String, dynamic>> value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBestSelling() async {
    QuerySnapshot<Map<String, dynamic>> value = await _productCollectionRef.get();
    return value.docs;
  }
}