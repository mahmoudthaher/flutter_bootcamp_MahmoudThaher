import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  final String DOMAIN = "192.168.8.113:3333";

  Future<String> getToken() async {
    var storage = FlutterSecureStorage();
    String result = await storage.read(key: "token") as String;
    return result;
  }

  Future<dynamic> getRequest(String path) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    var token = await getToken();
    var headers = {"Authorization": token};
    http.Response resposne = await http.get(uriFunction, headers: headers);
    return resposneFunction(resposne);
  }

  Future<dynamic> getRequest2(String path) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response resposne = await http.get(uriFunction);
    return resposneFunction(resposne);
  }

  Future<dynamic> postRequest(String path, Map body) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response resposne = await http.post(uriFunction, body: body);
    return resposneFunction(resposne);
  }

  Future<dynamic> putRequest(String path, Map body) async {
    Uri uriFunction = Uri.https(DOMAIN, path);
    http.Response resposne = await http.put(uriFunction, body: body);
    return resposneFunction(resposne);
  }

  dynamic resposneFunction(http.Response resposne) {
    switch (resposne.statusCode) {
      case 200:
      case 201:
        dynamic jsonObject = jsonDecode(resposne.body);
        return jsonObject;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthrizied";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }

  Future<http.Response> updateAlbum(String title) async {
    return http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
  }

  Future<dynamic> deleteRequest(String path) async {
    Uri uriFunction = Uri.https(DOMAIN, path);
    http.Response resposne = await http.delete(uriFunction);
    return resposneFunction(resposne);
  }
}
// Future<dynamic> getRequest(String path) async {
//     Uri uriFunction = Uri.https(DOMAIN, path);
//     http.Response resposne = await http.get(uriFunction);
//     return resposneFunction(resposne);
//   }

//   Future<dynamic> postRequest(String path, Map body) async {
//     Uri uriFunction = Uri.https(DOMAIN, path);
//     http.Response resposne = await http.post(uriFunction, body: body);
//     return resposneFunction(resposne);
//   }

  