
import 'package:appcsmju/APImodel/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://www.digital.mju.ac.th/api/login/mju/ad";

    final response = await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}