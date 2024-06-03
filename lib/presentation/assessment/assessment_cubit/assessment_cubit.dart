import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:measure_ap/data/firebase_services.dart';
import 'package:measure_ap/domain/assessment_model.dart';
import 'package:measure_ap/domain/question_model.dart';
import 'package:measure_ap/domain/repository/data_repository.dart';

part 'assessment_state.dart';

class AssessmentCubit extends Cubit<AssessmentState> {
  AssessmentCubit() : super(const AssessmentState());

  FutureOr<void> setAssessmentData({
    required AssessmentModel assessmentModel,
  }) {
    emit(state.copyWith(
      assessmentModel: AssessmentModel(
        cognitiveStatus: assessmentModel.cognitiveStatus,
        applicaableMeasures: assessmentModel.applicaableMeasures,
        name: assessmentModel.name,
      ),
    ));
  }

  void addQuestion(Map<String, dynamic> question) {
    final updatedQuestions =
        List<Map<String, dynamic>>.from(state.selectedQuestions);

    final existingIndex = updatedQuestions
        .indexWhere((q) => q['questionType'] == question['questionType']);

    if (existingIndex != -1) {
      updatedQuestions[existingIndex] = question;
    } else {
      updatedQuestions.add(question);
    }

    emit(state.copyWith(selectedQuestions: updatedQuestions));
  }

  void sendDataTofireStore() async {
    final DataRepository dataRepository = DataRepositoryImpl();
    try {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      await dataRepository.saveAssessmentsToFirestore(
          state.selectedQuestions, state.assessmentModel!);
      calculateResult();
      emit(state.copyWith(stateStatus: StateStatus.success));
    } catch (e) {
      emit(state.copyWith(stateStatus: StateStatus.error));
    }
  }

  void calculateResult() async {
    final data = state.selectedQuestions;
    List<int> marks = [];
    for (var d in data) {
      if (d['answer']['isAnswerCorrect']) {
        emit(state.copyWith(results: marks..add((d['answer']['totalMark']))));
      } else {}
    }
  }
}
