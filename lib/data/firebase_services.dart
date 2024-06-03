import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:measure_ap/domain/answer_model.dart';
import 'package:measure_ap/domain/assessment_model.dart';
import 'package:measure_ap/domain/response_model.dart';

class FirebaseServices {
  late FirebaseFirestore _firebaseFirestore;
  FirebaseServices._internal({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
 static final FirebaseServices _instance = FirebaseServices._internal();
 factory FirebaseServices({FirebaseFirestore? firebaseFirestore}) {
    if (firebaseFirestore != null) {
      _instance._firebaseFirestore = firebaseFirestore;
    }
    return _instance;
  }
  Future<void> saveAssessmentsToFirestore(
    List<Map<String, dynamic>> updatedQuestions,
    AssessmentModel assessmentModel,
  ) async {
    try {
      final CollectionReference assessmentsCollection =
          _firebaseFirestore.collection('assessments');

      List<AnswerModel> assessments =
          updatedQuestions.map((item) => AnswerModel.fromMap(item)).toList();

      List<Map<String, dynamic>> assessmentsData =
          assessments.map((assessment) => assessment.toMap()).toList();

      Map<String, dynamic> documentData = {
        'assessment': assessmentModel.toMap(),
        'questions': assessmentsData,
      };

      await assessmentsCollection.add(documentData);
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<List<ResponseModel>> fetchAssessmentsFromFirestore() async {
    try {
      final CollectionReference assessmentsCollection =
          _firebaseFirestore.collection("assessments");
      QuerySnapshot querySnapshot = await assessmentsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ResponseModel.fromMap(data);
      }).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
