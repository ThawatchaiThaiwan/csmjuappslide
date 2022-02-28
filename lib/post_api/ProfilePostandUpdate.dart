import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ProfileService {
  Future<bool> postImage(Map<String, String> body, String filepath) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String postimageUrl = 'https://wwwdev.csmju.com/api/student/create';
    String updateimageUrl = 'https://wwwdev.csmju.com/api/student/update/';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken',
    };

var request = http.MultipartRequest('POST',Uri.parse(postimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('PictureProfile', filepath,));
var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
    /* if () {
      var request = http.MultipartRequest('PUT', Uri.parse(updateimageUrl));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      request.files
          .add(await http.MultipartFile.fromPath('PictureProfile', filepath));
      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else if (filepath.isEmpty) {
      var request = http.MultipartRequest('POST', Uri.parse(postimageUrl));
      request.headers.addAll(headers);
      request.fields.addAll(body);
      request.files
          .add(await http.MultipartFile.fromPath('PictureProfile', filepath));
      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  } */
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