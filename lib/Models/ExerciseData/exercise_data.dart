import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exercise_data.freezed.dart';
part 'exercise_data.g.dart';

@freezed
class ExerciseData with _$ExerciseData {
  factory ExerciseData({
    @Default("") String id,
    @Default("") String bodyPart,
    @Default("") String equipment,
    @Default("") String gifUrl,
    @Default("") String name,
    @Default("") String target,
  }) = _ExerciseData;

  factory ExerciseData.fromJson(Map<String, Object?> json)
  => _$ExerciseDataFromJson(json);
}