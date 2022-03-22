import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
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
    /* if (nameEN?.isNotEmpty ?? false) {
      
      String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update/$id';
      print(updateimageUrl);
       Dio dio = new Dio();

      Map<String, dynamic> map = {};
        map['PictureProfile'] =
            await MultipartFile.fromFile(filepath);
        
        FormData formdata = FormData.fromMap(map);
      

      var response = await dio.put(updateimageUrl,
          data: formdata,
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
    } */

/*      var image = base64Url.encode(File(filepath).readAsBytesSync());
 */
    String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update/$id';
    var response1 = await http.put(Uri.parse(updateimageUrl),
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
          //"PictureProfile": filepath.toString(),
          //"PictureProfile": await MultipartFile.fromFile(filepath),
        }));

    if (response1.statusCode == 200) {
      print("put success");
      print(filepath);
    } else {
      var messageError = "Can not update this user!!";
      print(messageError);
      print(response1.statusCode);
    }

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
