import 'package:gradeproject/models/login_model.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class APIService{
  Future<LoginResponseModel> login(LoginRequestModel RequestModel) async{
    Uri url = "https://graduation-project-apis.herokuapp.com/login" as Uri;

    final response = await http.post(url,body:RequestModel.toJson());
    if(response.statusCode == 200 || response.statusCode== 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
  }
}