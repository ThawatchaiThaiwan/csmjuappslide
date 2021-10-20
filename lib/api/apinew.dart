// To parse this JSON data, do
//
//     final apinew = apinewFromJson(jsonString);

import 'dart:convert';

List<Apinew> apinewFromJson(String str) =>
    List<Apinew>.from(json.decode(str).map((x) => Apinew.fromJson(x)));

String apinewToJson(List<Apinew> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apinew {
  Apinew({
    required this.newsId,
    required this.newsDetail,
    //required this.newsDate,
    required this.newsTime,
    required this.newsPicture,
    required this.newsTitle,
    required this.newsFile,
    required this.newsLinks,
    required this.newsType,
  });

  final int newsId;
  final String newsDetail;
  //final DateTime newsDate;
  final String newsTime;
  final String newsPicture;
  final String newsTitle;
  final String newsFile;
  final String newsLinks;
  final String newsType;

  factory Apinew.fromJson(Map<String, dynamic> json) => Apinew(
        newsId: json["newsId"] == null ? null : json["newsId"],
        newsDetail: json["News_Detail"] == null ? null : json["News_Detail"],
        //newsDate: json["News_Date"] == null ? null : DateTime.parse(json["News_Date"]),
        newsTime: json["News_Time"] == null ? null : json["News_Time"],
        newsPicture: json["News_Picture"] == null ? null : json["News_Picture"],
        newsTitle: json["News_Title"] == null ? null : json["News_Title"],
        newsFile: json["News_File"] == null ? null : json["News_File"],
        newsLinks: json["News_links"] == null ? null : json["News_links"],
        newsType: json["News_Type"] == null ? null : json["News_Type"],
      );

  Map<String, dynamic> toJson() => {
        "newsId": newsId == null ? null : newsId,
        "News_Detail": newsDetail == null ? null : newsDetail,
        //"News_Date": newsDate == null ? null : "${newsDate.year.toString().padLeft(4, '0')}-${newsDate.month.toString().padLeft(2, '0')}-${newsDate.day.toString().padLeft(2, '0')}",
        "News_Time": newsTime == null ? null : newsTime,
        "News_Picture": newsPicture == null ? null : newsPicture,
        "News_Title": newsTitle == null ? null : newsTitle,
        "News_File": newsFile == null ? null : newsFile,
        "News_links": newsLinks == null ? null : newsLinks,
        "News_Type": newsType == null ? null : newsType,
      };
}
