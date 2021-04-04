import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();
  login(email, password) async {
    try {
      return await dio.post(
          'https://graduation-project-apis.herokuapp.com/login', data:{
            "email":email,
            "password": password
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    }
    on DioError catch(e){
      Fluttertoast.showToast(msg: e.response.data['msg'],);
    }
  }
}