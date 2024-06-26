import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measure_ap/domain/repository/data_repository.dart';
import 'package:measure_ap/domain/models/response_model.dart';

import '../../assessment/assessment_cubit/assessment_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> fetchAssessments() async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    try {
      final List<ResponseModel> assessments =
          await DataRepositoryImpl().fetchAssessmentsFromFirestore();
      log(assessments.length.toString());
      emit(state.copyWith(
          results: assessments, stateStatus: StateStatus.success));
    } catch (e) {
      log("Error fetching assessments: $e");
      emit(state.copyWith(stateStatus: StateStatus.error));
    }
  }
}
