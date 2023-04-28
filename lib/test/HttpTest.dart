import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpTest{


  Future<void> httpGet() async {
    final url = 'http://2.tcp.eu.ngrok.io:11227/users';
    final uri = Uri.parse(url);
    var responce = await http.get(uri);
    print(responce.body);
    print(responce.statusCode);
    try{
      var responce = await Dio().get(url);
      // print(responce);
      // print(responce.statusCode);
    }catch(error){
      var responce = await Dio().get(url);
      print(404);
      print(responce.statusCode);
    }
  }


}