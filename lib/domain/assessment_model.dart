import 'dart:convert';


import 'package:measure_ap/domain/question_model.dart';

class AssessmentModel {
  final String cognitiveStatus;
  final String applicaableMeasures;
  final String name;
  AssessmentModel({
    required this.cognitiveStatus,
    required this.applicaableMeasures,
    required this.name,
  });

  AssessmentModel copyWith({
    String? cognitiveStatus,
    String? applicaableMeasures,
    String? name,
  }) {
    return AssessmentModel(
      cognitiveStatus: cognitiveStatus ?? this.cognitiveStatus,
      applicaableMeasures: applicaableMeasures ?? this.applicaableMeasures,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cognitiveStatus': cognitiveStatus});
    result.addAll({'applicaableMeasures': applicaableMeasures});
    result.addAll({'name': name});
  
    return result;
  }

  factory AssessmentModel.fromMap(Map<String, dynamic> map) {
    return AssessmentModel(
      cognitiveStatus: map['cognitiveStatus'] ?? '',
      applicaableMeasures: map['applicaableMeasures'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AssessmentModel.fromJson(String source) => AssessmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssessmentModel(cognitiveStatus: $cognitiveStatus, applicaableMeasures: $applicaableMeasures, name: $name, questions: )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AssessmentModel &&
      other.cognitiveStatus == cognitiveStatus &&
      other.applicaableMeasures == applicaableMeasures &&
      other.name == name ;
  }

  @override
  int get hashCode {
    return cognitiveStatus.hashCode ^
      applicaableMeasures.hashCode ^
      name.hashCode ;
  }
}
