// To parse this JSON data, do
//
//     final apinew = apinewFromJson(jsonString);

import 'dart:convert';

List<Apinew> apinewFromJson(String str) => List<Apinew>.from(json.decode(str).map((x) => Apinew.fromJson(x)));

String apinewToJson(List<Apinew> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apinew {
    Apinew({
        
        required this.newsDetail,
        required this.newsDate,
        required this.newsTime,
        required this.newsPicture,
        required this.newsTitle,
        required this.newsFile,
        required this.newsLinks,
        required this.newsType,
    });

    
    String newsDetail;
    String newsDate;
    String newsTime;
    String newsPicture;
    String newsTitle;
    String newsFile;
    String newsLinks;
    String newsType;

    factory Apinew.fromJson(Map<String, dynamic> json) => Apinew(
        
        newsDetail: json["News_Detail"],
        newsDate: json["News_Date"],
        newsTime: json["News_Time"],
        newsPicture: json["News_Picture"],
        newsTitle: json["News_Title"],
        newsFile: json["News_File"],
        newsLinks: json["News_links"],
        newsType: json["News_Type"],
    );

    Map<String, dynamic> toJson() => {
        
        "News_Detail": newsDetail,
        "News_Date": newsDate,
        "News_Time": newsTime,
        "News_Picture": newsPicture,
        "News_Title": newsTitle,
        "News_File": newsFile,
        "News_links": newsLinks,
        "News_Type": newsType,
    };
}
