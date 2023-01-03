import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  //take instance from collection on firestore
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection("categories");

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection("products");
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await categoryCollection.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await productsCollection.get();
    return value.docs;
  }
}
