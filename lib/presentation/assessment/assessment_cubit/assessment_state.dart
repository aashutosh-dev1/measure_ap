part of 'assessment_cubit.dart';

enum StateStatus { initial, loading, success, error }

class AssessmentState extends Equatable {
  final AssessmentModel? assessmentModel;
  final List<Map<String, dynamic>> selectedQuestions;
  final StateStatus stateStatus;
  final List<int>? results;
  final int total;
  const AssessmentState({
    this.assessmentModel,
    this.selectedQuestions = const [],
    this.stateStatus = StateStatus.initial,
    this.results,
    this.total = 0,
  });

  @override
  List<Object?> get props => [assessmentModel, selectedQuestions, stateStatus];

  AssessmentState copyWith({
    AssessmentModel? assessmentModel,
    List<Map<String, dynamic>>? selectedQuestions,
    StateStatus? stateStatus,
    List<int>? results,
    int? total,
  }) {
    return AssessmentState(
      assessmentModel: assessmentModel ?? this.assessmentModel,
      selectedQuestions: selectedQuestions ?? this.selectedQuestions,
      stateStatus: stateStatus ?? StateStatus.initial,
      results: results ?? this.results,
      total: total ?? this.total,
    );
  }
}
