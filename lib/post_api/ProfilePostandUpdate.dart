import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileService {
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String postimageUrl = 'https://wwwdev.csmju.com/api/student/create';
    String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken',
    };

    if (filepath != null) {
      var request = http.MultipartRequest('UPDATE', Uri.parse(updateimageUrl));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('image', filepath));
      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else if (filepath == null) {
      var request = http.MultipartRequest('POST', Uri.parse(postimageUrl));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('image', filepath));
      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  return false;
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