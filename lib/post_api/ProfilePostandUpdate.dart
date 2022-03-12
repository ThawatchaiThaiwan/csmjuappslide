import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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
      ID = dataStudent['studentId'];
      nameEN = dataStudent["nameEn"];
      nameTh = dataStudent["nameTh"];
      surnameTh = dataStudent["surnameTh"];
      print(ID);
      print(nameEN);
    }
    String id = ID.toString();
    var authToken1 = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String postimageUrl = 'https://wwwdev.csmju.com/api/student/create';
    
    
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken1',
    };
    if (nameEN?.isEmpty ?? true) {
      var request = http.MultipartRequest('POST', Uri.parse(postimageUrl))
        ..fields['PictureProfile'] = filepath
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
    }
    if (nameEN?.isNotEmpty ?? false) {
      
      String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update/$id';
      print(updateimageUrl);
      var request = http.MultipartRequest('POST', Uri.parse(updateimageUrl))
        //..fields['studentId'] = id
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
          'PictureProfile',
          filepath,
        ));
      var response1 = await request.send();
      var responsed = await http.Response.fromStream(response1);
      if (responsed.statusCode == 201) {
        print("update success");
        print(responsed.statusCode);
      } else {
        print("update fail");
        print(responsed.statusCode);
      }
    }

    /* var request = http.MultipartRequest("POST", Uri.parse(url));

    request.headers.addAll(headers);
    request.fields.addAll(updateProfileInfo.toJson());

    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.files.add(
        await http.MultipartFile.fromPath('signature', signatureFile.path));

    print(" Update Profile Json ${updateProfileInfo.toJson()}");
    print("Request Fields ${request.fields}");
    http.StreamedResponse response = await request.send();

    String respStr = await response.stream.bytesToString();
    dynamic respJson;

    try {
      respJson = jsonDecode(respStr);
    } on FormatException catch (e) {
      print(e.toString());
    }

    print('API ${response.statusCode}\n  $respJson');

    bool isSuccess = response.statusCode == 200;
    var data = json.decode(respStr);
 */

/*      var image = base64Url.encode(File(filepath).readAsBytesSync());
 */
    /* var response1 = await http.put(Uri.parse(updateimageUrl),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $authToken1',
          },
          body: jsonEncode({
            "nameTh": nameTh,
            "surnameTh": surnameTh,
            "studentId": id,
            "studentCode": studentcode,
            "nameEn": body['nameEn'],
            "surnameEn": body['surnameEn'],
            "EmailStudent": body['EmailStudent'],
            "mobile": body['mobile'],
            "Address": body['Address'],
            "PictureProfile": await MultipartFile.fromFile(filepath),
          }));
      if (response1.statusCode == 200) {
        print("put success");
        print(filepath);
      } else {
        var messageError = "Can not update this user!!";
        print(messageError);
        print(response1.statusCode);
      } */

    /* BaseOptions options = new BaseOptions(
        baseUrl: updateimageUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );

      Dio dio = new Dio(options);
      FormData formData = FormData.fromMap({
        "PictureProfile":
            await MultipartFile.fromFile(filepath, filename: 'file.jpg'),
      });

      var response = await dio.put(updateimageUrl,
          data: formData,
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {
                "Content-Type": "application/json",
                'Authorization': 'Bearer $authToken1',
              }));

      if (response.statusCode == 200) {
        print("put success");
      } else {
        var messageError = "Can not update this user!!";
        print(messageError);
        print(response.statusCode);
      }
 */
    /* Dio dio = new Dio();

      FormData formData = FormData.fromMap({
        "PictureProfile": await MultipartFile.fromFile(filepath, filename: 'file.jpg'),
      });

      var response = await dio.post(updateimageUrl,
          data: formData,
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {
                "Content-Type": "application/json",
                'Authorization': 'Bearer $authToken1',
              }));

      if (response.statusCode == 200) {
        print("put success");
      } else {
        var messageError = "Can not update this user!!";
        print(messageError);
        print(response.statusCode);
      } */
    return true;
  }
}
