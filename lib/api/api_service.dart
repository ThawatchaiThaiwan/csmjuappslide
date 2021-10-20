import 'package:appcsmju/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = "https://reqres.in/api/login";
    

    //เอา API มาเปลี่ยนที่นี่

    final response =
        await http.post(Uri.parse(url),body: requestModel.toJson());
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to laod Data');
    }
    

  }
}
