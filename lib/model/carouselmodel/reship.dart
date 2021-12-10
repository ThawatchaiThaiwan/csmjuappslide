// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);
import 'dart:convert';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  Recipe({
    required this.activityId,
    /* required this.activityStart, */
    required this.activityTimeStart,
    required this.activityTimeEnd,
    required this.activityOrganizer,
    required this.activityLocation,
    required this.activityDetail,
    required this.activityTitle,
    /* required this.activityEnd, */
  });

  int activityId;
  /* DateTime activityStart; */
  String activityTimeStart;
  String activityTimeEnd;
  String activityOrganizer;
  String activityLocation;
  String activityDetail;
  String activityTitle;
  /* DateTime activityEnd; */

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      activityId: json["activityId"] as int,
      /* activityStart: json["Activity_Start"] as DateTime, */
      activityTimeStart: json["Activity_TimeStart"] as String,
      activityTimeEnd: json["Activity_TimeEnd"] as String,
      activityOrganizer: json["Activity_Organizer"] as String,
      activityLocation: json["Activity_Location"] as String,
      activityDetail: json["Activity_Detail"] as String,
      activityTitle: json["Activity_Title"] as String,
      /* activityEnd: json["Activity_End"] as DateTime, */
    );
  }
  

    Map<String, dynamic> toJson() => {
        "activityId": activityId,
        /* "Activity_Start": activityStart, */
        "Activity_TimeStart": activityTimeStart ,
        "Activity_TimeEnd": activityTimeEnd ,
        "Activity_Organizer": activityOrganizer ,
        "Activity_Location": activityLocation ,
        "Activity_Detail": activityDetail,
        "Activity_Title": activityTitle,
        /* "Activity_End": activityEnd, */
    };


  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {  image: $activityOrganizer, }';
  }
}




/* class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({required this.name, required this.images, required this.rating, required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
} */