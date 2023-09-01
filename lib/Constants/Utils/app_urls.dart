import 'package:exercise_assignment/Constants/constants.dart';

class AppUrls {
  static String baseUrl = inDevelopment ? "https://exercisedb.p.rapidapi.com" : "https://exercisedb.p.rapidapi.com";
  static String apiBaseUrl = "$baseUrl/exercises";

  static String isUserExistUrl(contact){
    return "${apiBaseUrl}users/is-user-exist/$contact";
  }

  static String getExercises = "$apiBaseUrl/exercises";
}