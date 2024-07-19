import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';

class CloudFirestoreApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<ResultApi> setUserData({
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      var doc =
          _firestore.collection(AppConstant.usersCollection).doc(documentId);
      await doc.set(data);
      return ResultApi(isError: false, value: doc.id);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ResultApi> getUserData(String documentId) async {
    try {
      var doc =
          _firestore.collection(AppConstant.usersCollection).doc(documentId);
      var data = await doc.get();
      return ResultApi(isError: false, value: data.data());
    } catch (e) {
      throw e.toString();
    }
  } 
}
