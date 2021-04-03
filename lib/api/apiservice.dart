import 'package:gradeproject/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class APIService {
  Future<LoginResponseModel> getGoodRequest1(
      LoginRequestModel RequestModel) async {
    var apiurl = Uri.https(
        'graduation-project-apis.herokuapp.com', '/login', {'q': '{http}'});
    http.Response response = await http.get(apiurl);
    String data = response.body;

    print(jsonDecode(data));
  }

  Future<LoginResponseModel> login(LoginRequestModel RequestModel) async {
    String url = "graduation-project-apis.herokuapp.com/login";
    var apiurl = Uri.https(
        'graduation-project-apis.herokuapp.com', '/login', {'q': '{http}'});
    final response = await http.post(apiurl,
        body: RequestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
