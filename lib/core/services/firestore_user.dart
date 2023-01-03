import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_usamaa_app/models/user_model.dart';

class FirestoreUser {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  Future addUserToFireStore(UserModel userModel) async {
    return await collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await collectionReference.doc(uid).get();
  }
}
