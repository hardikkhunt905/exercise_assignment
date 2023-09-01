// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExerciseData _$$_ExerciseDataFromJson(Map<String, dynamic> json) =>
    _$_ExerciseData(
      id: json['id'] as String? ?? "",
      bodyPart: json['bodyPart'] as String? ?? "",
      equipment: json['equipment'] as String? ?? "",
      gifUrl: json['gifUrl'] as String? ?? "",
      name: json['name'] as String? ?? "",
      target: json['target'] as String? ?? "",
    );

Map<String, dynamic> _$$_ExerciseDataToJson(_$_ExerciseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodyPart': instance.bodyPart,
      'equipment': instance.equipment,
      'gifUrl': instance.gifUrl,
      'name': instance.name,
      'target': instance.target,
    };
