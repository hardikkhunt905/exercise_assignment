import 'package:exercise_assignment/Constants/constants.dart';

class AppUrls {
  static String baseUrl = inDevelopment ? "https://exercisedb.p.rapidapi.com" : "https://exercisedb.p.rapidapi.com";

  static String getExercises = "$baseUrl/exercises";
  static String getExerciseDetail = "$getExercises/exercise/";
}