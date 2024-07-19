// import 'package:flutter_note_mate/core/helpre/is_connected_network.dart';
// import 'package:flutter_note_mate/core/model/api_result.dart';
// import 'package:flutter_note_mate/features/auth/signup/data/api/cloud_firestore_api.dart';

// class CloudFirestoreRepo {
//   final CloudFirestoreApi cloudFirestoreApi;

//   CloudFirestoreRepo({required this.cloudFirestoreApi});

//   Future<ResultApi> updateData({
//     required String documentId,
//     required Map<String, dynamic> data,
//   }) async {
//     if (await isConnectedNetwork()) {
//       try {
//         final ResultApi resultApi = await cloudFirestoreApi.updateData(
//           documentId: documentId,
//           data: data,
//         );
//         return ResultApi(value: resultApi, isError: false);
//       } catch (e) {
//         return ResultApi(isError: true, value: e.toString());
//       }
//     } else {
//       return ResultApi(isError: true, value: 'No internet access');
//     }
//   }
// }
