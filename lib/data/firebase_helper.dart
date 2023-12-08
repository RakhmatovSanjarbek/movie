import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future addBannerMovie(Map<String, dynamic> row) async {
    final doc = firestore.collection("banner_movie").doc();
    row["id"] = doc.id;
    await doc.set(row);
  }

  Future addUzbekMovie(Map<String, dynamic> row) async {
    final doc = firestore.collection("uzbek_movie").doc();
    row["id"] = doc.id;
    await doc.set(row);
  }
  Future addTranslationMovie(Map<String, dynamic> row) async {
    final doc = firestore.collection("translation_movie").doc();
    row["id"] = doc.id;
    await doc.set(row);
  }
  Future addWorldMovie(Map<String, dynamic> row) async {
    final doc = firestore.collection("world_movie").doc();
    row["id"] = doc.id;
    await doc.set(row);
  }
  Future addIndeaMovie(Map<String, dynamic> row) async {
    final doc = firestore.collection("indea_movie").doc();
    row["id"] = doc.id;
    await doc.set(row);
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  getBannerMovie() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> result = [];
    final movieList =
    await firestore.collection("banner_movie").get().then((value) {
      result = value.docs;
    });
    return result;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getUzbekMovie() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> result = [];
    final movieList =
        await firestore.collection("uzbek_movie").get().then((value) {
      result = value.docs;
    });
    return result;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getTranslationMovie() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> result = [];
    final movieList = await firestore.collection("translation_movie").get().then((value) {
      result =value.docs;
    });
    return result;
  }
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getWorldMovie() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> result = [];
    final movieList =
        await firestore.collection("world_movie").get().then((value) {
      result = value.docs;
    });
    return result;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getIndeaMovie() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> result = [];
    final movieList = await firestore.collection("indea_movie").get().then((value) {
      result =value.docs;
    });
    return result;
  }

  Future deleteBannerMovie(String? id) async {
    await firestore.collection("banner_movie").doc(id).delete();
  }

  Future deleteUzbekMovie(String? id) async {
    await firestore.collection("uzbek_movie").doc(id).delete();
  }
  Future deleteTranslationMovie(String? id) async {
    await firestore.collection("translation_movie").doc(id).delete();
  }
  Future deleteWorldMovie(String? id) async {
    await firestore.collection("world_movie").doc(id).delete();
  }
  Future deleteIdeaMovie(String? id) async {
    await firestore.collection("indea_movie").doc(id).delete();
  }

  Future updateUzbekMovie(String? id) async {}
}
