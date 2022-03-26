import 'dart:convert';
import 'dart:io';
import 'package:champian_web/api_service/utils.dart';
import 'package:champian_web/style_guide/const_data.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  final String _baseUrl = "3.109.248.44:8184";

  Future<dynamic> get(String endPoint) async {
    var responseJson;
    var url = Uri.http(_baseUrl, endPoint);
    var token = Utils.readStorage(key: StorageKey.TOKEN);
    try {
      final response = await http.get(url, headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      });
      responseJson = checkError(response);
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  Future<dynamic> post(String endPoint, Map data) async {
    var responseJson;
    var url = Uri.http(_baseUrl, endPoint);
    var token = Utils.readStorage(key: StorageKey.TOKEN);
    try {
      final response = await http.post(url, body: jsonEncode(data), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json'
      });
      responseJson = checkError(response);
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  Future<dynamic> auth(String endPoint, Map data) async {
    var responseJson;
    var url = Uri.http(_baseUrl, endPoint);
    var header = Utils().getJsonOnlyHeader();
    try {
      final response = await http.post(url, body: jsonEncode(data), headers: header);
      responseJson = checkError(response);
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  checkError(http.Response response){
    print(response.body);
    var body = json.decode(
        response.body.toString()
    );

    var msg;
    if(body["message"] == null){
      msg = body["errors"][0]["msg"];
    }else{
      msg = body["message"];
    }
    switch (response.statusCode) {
      case 200:
        var responseBody = json.decode(
            response.body.toString()
        );
        return responseBody;
      case 400:
        Utils.showDialogBox(title: "OOPS!", msg: "$msg", buttonTitle: "OK", cancel: false);
        break;
      case 401:
        Utils.showDialogBox(title: "OOPS!!", msg: "$msg", buttonTitle: "OK", cancel: false);
        break;
      case 403:
        if(body["status"] == 3){
          Utils.showDialogBoxWithFunc(title: "Opps!", msg: "$msg", fun: () => {}, cancel: false );
        }else{
          Utils.showDialogBox(title: "OOPS!", msg: "$msg", buttonTitle: "OK", cancel: false);
        }
        break;
      case 500:
        if(msg == "Invalid Token" || body["status"] == 3){
          Utils.showDialogBoxWithFunc(title: "OOPS!", msg: "$msg", fun: () => {}, cancel: false );
        }else{
          Utils.showDialogBox(title: "OOPS!", msg: "$msg", buttonTitle: "OK", cancel: false);
        }
        break;
      default:
        Utils.showDialogBox(title: "OOPS!", msg: "$msg", buttonTitle: "OK", cancel: false);
        break;
    }

  }

}