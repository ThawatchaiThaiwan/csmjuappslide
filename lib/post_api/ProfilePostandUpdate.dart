import 'dart:convert';
import 'dart:io';

import 'package:appcsmju/footbar/Foot.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  var nameEN;
  var nameTh;
  var surnameTh;
  var ID;
  var studentcode;
  

  Future<bool> postImage(
    Map<String, String> body,
    String filepath,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    studentcode = preferences.getString('Studentcode');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var response = await http.get(
      Uri.parse("https://wwwdev.csmju.com/api/student/$studentcode"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );
    var getuser = json.decode(response.body);
    var user = getuser['data'];
    print(user);
    for (var dataStudent in user) {
      if (ID?.isnotEmpty ?? true) {
        ID = dataStudent['studentId'];
        nameEN = dataStudent["nameEn"];
        nameTh = dataStudent["nameTh"];
        surnameTh = dataStudent["surnameTh"];
        print(ID);
      }
    }
    String id = ID.toString();
    var authToken1 = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String postimageUrl = 'https://wwwdev.csmju.com/api/student/create';
    String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update/$id';
    print(updateimageUrl);
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken1',
    };
    if (nameEN?.isEmpty ?? true) {
      var request = http.MultipartRequest('POST', Uri.parse(postimageUrl))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
          'PictureProfile',
          filepath,
        ));
      var response = await request.send();
      if (response.statusCode == 201) {
        print("post success");
      } else {
        print("post fail");
      }
    } else {
      var response1 = await http.post(Uri.parse(updateimageUrl),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $authToken1',
          },
          
          body: jsonEncode({
            "nameTh": nameTh,
            "surnameTh": surnameTh,
            "studentId": ID,
            "studentCode": studentcode,
            "pictureProfile": filepath,
            "nameEn": body['_nameENController.text'],
            "surnameEn": body['_surnameENController.text'],
            "EmailStudent": body['_emailController.text'],
            "mobile": body['_mobileController.text'],
            "Address": body['_addressController.text'],
          }));
      if (response1.statusCode == 200) {
        var messageSuccess = json.decode(response.body)['message'];

        print(messageSuccess);
      } else {
        var messageError = "Can not update this user!!";
        print(messageError);
      }

      /* String stringValue = ID.toString();
      var request1 = http.MultipartRequest('POST', Uri.parse(updateimageUrl))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
          'PictureProfile',
          filepath,
        )); */
      /* var response1 = await dio.put(updateimageUrl,
          data: body,

          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken1',
              'Content-Type': 'multipart/form-data',
            },
          )); */
      /* request1.fields['nameTh'] = nameTh;
      request1.fields['surnameTh'] = surnameTh;
      request1.fields['studentCode'] = studentcode;
      request1.fields.addAll(body);
      request1.headers.addAll(headers);
      request1.fields['studentId'] = stringValue;
      request1.files.add(await http.MultipartFile.fromPath(
        'PictureProfile',
        filepath,
      ));*/
      //var response1 = await request.send();
      if (response1.statusCode == 200) {
        print('response1.statusCode');
      } else {
        print(response1.statusCode);
      }
      //Dio dio = new Dio();

      /* FormData formData = new FormData.fromMap(
        {
          'nameTh': body['nameTh'],
          "surnameTh": body['surnameTh'],
          "nameEn": body['_nameENController.text'],
          "surnameEn": body['_surnameENController.text'],
          "studentCode": body['studentcode'],
          "EmailStudent": body['_emailController.text'],
          "mobile": body['_mobileController.text'],
          "Address": body['_addressController.text'],
          "PictureProfile": await http.MultipartFile.fromPath(
            'PictureProfile',
            filepath,
          ),
        },
      ); */
      ;

      /* var response = await dio.put(updateimageUrl,
          data: formData,
          options: Options(followRedirects: false, headers: {
            HttpHeaders.authorizationHeader: 'Bearer $authToken1',
          })); */

    }
    /*  var request = http.MultipartRequest('PUT', Uri.parse(updateimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath(
        'PictureProfile',
        filepath,
      ));
      return true; */
    return true;
  }
}



/* var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('Complain_Picture', filepath,));
var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false; */