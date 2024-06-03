import 'dart:async';

import 'package:measure_ap/data/firebase_services.dart';

import '../models/assessment_model.dart';
import '../models/response_model.dart';

sealed class DataRepository {
  Future<void> saveAssessmentsToFirestore(
    List<Map<String, dynamic>> updatedQuestions,
    AssessmentModel assessmentModel,
  );
  FutureOr<List<ResponseModel>> fetchAssessmentsFromFirestore();
}

class DataRepositoryImpl implements DataRepository {
  @override
  FutureOr<List<ResponseModel>> fetchAssessmentsFromFirestore() async {
    return await FirebaseServices().fetchAssessmentsFromFirestore();
  }

  @override
  Future<void> saveAssessmentsToFirestore(
      List<Map<String, dynamic>> updatedQuestions,
      AssessmentModel assessmentModel) async {
    return await FirebaseServices()
        .saveAssessmentsToFirestore(updatedQuestions, assessmentModel);
  }
}
