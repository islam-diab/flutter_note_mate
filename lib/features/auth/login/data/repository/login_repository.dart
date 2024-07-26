import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/helpre/is_connected_network.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/login/data/api/login_api.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/cloud_firestore_api.dart';
import 'package:flutter_note_mate/features/note_veiw/data/models/note_model.dart';

class LoginRepository {
  final LoginApi loginApi;
  final CloudFirestoreApi cloudFirestoreApi;

  LoginRepository({required this.loginApi, required this.cloudFirestoreApi});
  Future<ResultApi> login(String email, String password) async {
    if (await isConnectedNetwork()) {
      try {
        ResultApi result = await loginApi.login(email, password);

        ResultApi userData = await cloudFirestoreApi.getUserData(result.value);

        return ResultApi(value: userData.value, isError: false);
      } catch (e) {
        return ResultApi(isError: true, value: e.toString());
      }
    } else {
      return ResultApi(isError: true, value: 'No internet connection');
    }
  }

  Future<List<NoteModel>> getNotesFromFirestoreByUid(String uid) async {
    if (await isConnectedNetwork()) {
      try {
        List<Map<String, dynamic>> notesData =
            await cloudFirestoreApi.getNotesFromFirestore(
          collectionName: FirebaseConstant.notesCollection,
          query: (query) => query
              .where(FieldPath.documentId, isGreaterThanOrEqualTo: uid)
              .where(FieldPath.documentId, isLessThanOrEqualTo: '$uid\uf8ff'),
        );
 
        List<NoteModel> notes =
            notesData.map((data) => NoteModel.fromJson(data)).toList();
        return notes;
      } catch (e) {
        throw Exception(e.toString());
      }
    } else {
      throw Exception('No internet');
    }
  }
}
