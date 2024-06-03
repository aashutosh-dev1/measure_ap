part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<ResponseModel> results;
  final StateStatus stateStatus;
  const HomeState({
    this.results= const  [],
    this.stateStatus=StateStatus.initial
  });

  @override
  List<Object> get props => [results,stateStatus];

  HomeState copyWith({
    List<ResponseModel>? results,
    StateStatus? stateStatus,
  }) {
    return HomeState(
      results: results ?? this.results,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
}

