//Created on http://app.quicktype.io/
/* import 'dart:convert';

Borrowbackmodel borrowbackmodelFromJson(String str) => Borrowbackmodel.fromJson(json.decode(str));

String borrowbackmodelToJson(Borrowbackmodel data) => json.encode(data.toJson());

class Borrowbackmodel {
  final String equipmentId;
  final String Equipment_Code;
  final String Equipment_Quantity;
  final String Equipment_Name;
  final String Equipment_Brand;
  final String Equipment_Serialnumber;
  final String Equipment_Price;
  final String Equipment_Date;
  final String Equipment_Room;
  final String Equipment_Users;
  final String Equipment_Caretaker;
  final String Equipment_Status;
  final String Equipment_Note;
  final String Equipment_Type;
  final String Equipment_Detail;

  Borrowbackmodel({
    required this.equipmentId,
    required this.Equipment_Code,
    required this.Equipment_Quantity,
    required this.Equipment_Name,
    required this.Equipment_Brand,
    required this.Equipment_Serialnumber,
    required this.Equipment_Price,
    required this.Equipment_Date,
    required this.Equipment_Room,
    required this.Equipment_Users,
    required this.Equipment_Caretaker,
    required this.Equipment_Status,
    required this.Equipment_Note,
    required this.Equipment_Type,
    required this.Equipment_Detail,
  });

  factory Borrowbackmodel.fromJson(Map<String, dynamic> json) {
    return Borrowbackmodel(
      equipmentId: json["equipmentId"],
      Equipment_Code: json["Equipment_Code"],
      Equipment_Quantity: json["Equipment_Quantity"],
      Equipment_Name: json["Equipment_Name"],
      Equipment_Brand: json["Equipment_Brand"],
      Equipment_Serialnumber: json["Equipment_Serialnumber"],
      Equipment_Price: json["Equipment_Price"],
      Equipment_Date: json["Equipment_Date"],
      Equipment_Room: json["Equipment_Room"],
      Equipment_Users: json["Equipment_Users"],
      Equipment_Caretaker: json["Equipment_Caretaker"],
      Equipment_Status: json["Equipment_Status"],
      Equipment_Note: json["Equipment_Note"],
      Equipment_Type: json["Equipment_Type"],
      Equipment_Detail: json["Equipment_Detail"],
    );
  }
  Map<String, dynamic> toJson() => {
        
        "equipmentId": equipmentId,
        "Equipment_Code": Equipment_Code,
        "Equipment_Quantity": Equipment_Quantity,
        "Equipment_Name": Equipment_Name,
        "Equipment_Brand": Equipment_Brand,
        "Equipment_Serialnumber": Equipment_Serialnumber,
        "Equipment_Price": Equipment_Price,
        "Equipment_Date": Equipment_Date,
        "Equipment_Room": Equipment_Room,
        "Equipment_Users": Equipment_Users,
        "Equipment_Caretaker": Equipment_Caretaker,
        "Equipment_Status": Equipment_Status,
        "Equipment_Note": Equipment_Note,
        "Equipment_Type": Equipment_Type,
        "Equipment_Detail": Equipment_Detail,

    };
  static List<Borrowbackmodel> fromJsonList(List list) {
    return list.map((item) => Borrowbackmodel.fromJson(item)).toList();
  }

  @override
  String toString() => Equipment_Name;

  @override
  operator ==(o) => o is Borrowbackmodel && o.equipmentId == equipmentId;

  @override
  int get hashCode =>
      equipmentId.hashCode ^
      Equipment_Code.hashCode ^
      Equipment_Quantity.hashCode ^
      Equipment_Name.hashCode ^
      Equipment_Brand.hashCode ^
      Equipment_Serialnumber.hashCode ^
      Equipment_Price.hashCode ^
      Equipment_Date.hashCode ^
      Equipment_Room.hashCode ^
      Equipment_Users.hashCode ^
      Equipment_Caretaker.hashCode ^
      Equipment_Status.hashCode ^
      Equipment_Note.hashCode ^
      Equipment_Type.hashCode ^
      Equipment_Detail.hashCode ;
} */

//Created on http://app.quicktype.io/

class Borrowbackmodel {
  int newsId;
  String newsDetail;
  String newsDate;
  String newsTime;
  String newsPicture;
  String newsTitle;
  String newsFile;
  String newsLinks;
  String newsType;

  Borrowbackmodel({
    required this.newsId,
    required this.newsDetail,
    required this.newsDate,
    required this.newsTime,
    required this.newsPicture,
    required this.newsTitle,
    required this.newsFile,
    required this.newsLinks,
    required this.newsType,
  });

  factory Borrowbackmodel.fromJson(Map<String, dynamic> json) {
    return Borrowbackmodel(
      newsId: json["newsId"],
      newsDetail: json["News_Detail"],
      newsDate: json["News_Date"],
      newsTime: json["News_Time"],
      newsPicture: json["News_Picture"],
      newsTitle: json["News_Title"],
      newsFile: json["News_File"],
      newsLinks: json["News_links"],
      newsType: json["News_Type"],
    );
  }

  static List<Borrowbackmodel> fromJsonList(List list) {
    return list.map((item) => Borrowbackmodel.fromJson(item)).toList();
  }

  @override
  String toString() => newsType;

  @override
  operator ==(o) => o is Borrowbackmodel && o.newsId == newsId;

  @override
  int get hashCode =>
      newsId.hashCode ^
      newsDetail.hashCode ^
      newsDate.hashCode ^
      newsTime.hashCode ^
      newsPicture.hashCode ^
      newsTitle.hashCode ^
      newsFile.hashCode ^
      newsLinks.hashCode ^
      newsType.hashCode;
}
