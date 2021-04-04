import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradeproject/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class APIService {
 /* Future<LoginResponseModel> getGoodRequest1(
      LoginRequestModel RequestModel) async {
    var apiurl = Uri.https(
        'graduation-project-apis.herokuapp.com', '/login', {'q': '{http}'});
    http.Response response = await http.get(apiurl);
    String data = response.body;

    print(jsonDecode(data));
  }*/
  Future<LoginResponseModel> login(LoginRequestModel RequestModel) async {
    /*var apiurl = Uri.parse(
        'https://graduation-project-apis.herokuapp.com/login');*/
    var apiurl = Uri.https(
        'graduation-project-apis.herokuapp.com', '/login', {'q': '{http}'});
    final response = await http.post(apiurl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },        body: jsonEncode(RequestModel.toJson()));
    print("Status body:  ${response.body}");
    print("Status code:  ${response.statusCode}");

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}


