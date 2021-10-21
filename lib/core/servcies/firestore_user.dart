import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser{
  final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');

  Future addUserToFirestore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

   Future<DocumentSnapshot> getCurrentUser(String uId) async {
    return await _userCollectionRef.doc(uId).get();
  }
}