import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  final String DOMAIN = "jsonplaceholder.typicode.com";

  Future<String> getToken() async {
    return "";
  }

  Future<dynamic> getRequest(String path) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    var token = await getToken();
    var headers = {"Authorization": token};
    http.Response resposne = await http.get(uriFunction, headers: headers);
    return resposneFunction(resposne);
  }

  Future<dynamic> postRequest(String path, Map body) async {
    Uri uriFunction = Uri.http(DOMAIN, path);
    http.Response resposne = await http.post(uriFunction, body: body);
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
}
