import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';

class CloudFirestoreApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<ResultApi> setDataInFirestore({
    required String documentId,
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    try {
      var doc = _firestore.collection(collectionName).doc(documentId);
      await doc.set(data);
      return ResultApi(isError: false, value: doc.id);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ResultApi> getUserData(String documentId) async {
    try {
      var doc = _firestore
          .collection(FirebaseConstant.usersCollection)
          .doc(documentId);
      var data = await doc.get();
      return ResultApi(isError: false, value: data.data());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Map<String, dynamic>>> getNotesFromFirestore({
    required String collectionName,
    Query Function(Query query)? query,
  }) async {
    try {
      Query collectionQuery = _firestore.collection(collectionName);
      if (query != null) {
        collectionQuery = query(collectionQuery);
      }
      QuerySnapshot querySnapshot = await collectionQuery.get();
      List<Map<String, dynamic>> dataList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return dataList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ResultApi> deleteNotsInFirestore({
    required String collectionName,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).delete();
      return ResultApi(isError: false, value: 'Note deleted successfully');
    } catch (e) {
      return ResultApi(isError: true, value: e.toString());
    }
  }

  Future<ResultApi> updateDataInFirestore({
    required String collectionName,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).update(data);
      return ResultApi(isError: false, value: 'Data updated successfully');
    } catch (e) {
      return ResultApi(isError: true, value: e.toString());
    }
  }
}
