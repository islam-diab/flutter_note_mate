import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/helpre/is_connected_network.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/cloud_firestore_api.dart';
import 'package:flutter_note_mate/features/note_veiw/data/models/note_model.dart';

class NoteRepo {
  final CloudFirestoreApi cloudFirestoreApi;

  NoteRepo({required this.cloudFirestoreApi});

  Future<ResultApi> addNote({
    required String title,
    required String content,
    required String data,
    required String documentId,
    required int color,
  }) async {
    if (await isConnectedNetwork()) {
      try {
        NoteModel noteModel = NoteModel(
          title: title,
          content: content,
          color: color,
          date: data,
        );

        ResultApi result = await cloudFirestoreApi.setDataInFirestore(
          collectionName: FirebaseConstant.notesCollection,
          documentId: documentId,
          data: noteModel.toJson(),
        );
        return ResultApi(value: result.value, isError: false);
      } catch (e) {
        return ResultApi(isError: true, value: e.toString());
      }
    }
    return ResultApi(value: 'No internet', isError: true);
  }
}
