import 'dart:convert';
//import 'dart:developer';
import 'package:e_commerc/core/enums/request_type.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'fakestoreapi.com';
//fakestoreapi.com
//todojsonplaceholder.typicode.com
  static Future<dynamic> sendRequest({
    required RequestType type,
    required String route,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    var url = Uri.https(baseUrl, route, params);
    http.Response response;

    switch (type) {
      case RequestType.GET:
        response = await http.get(url, headers: headers);
        break;
      case RequestType.POST:
        response = await http.post(url, body:  jsonEncode(body), headers: headers);
        break;
      case RequestType.DELETE:
        response = await http.delete(url, body: jsonEncode(body), headers: headers);
        break;
      case RequestType.PUT:
        response = await http.put(url, body:  jsonEncode(body), headers: headers);
        break;
    }

    Map<String, dynamic> jsonResponse = {};
    dynamic result;
    String decodedBody = Utf8Codec().decode(response.bodyBytes);

    try {
      //
      result = jsonDecode(decodedBody);
    } catch (e) {}

    jsonResponse.putIfAbsent(
        // 'response', () => result == null ? {'message': decodedBody} : result
        'response',
        () => result ?? {'message': decodedBody});

    jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
    return jsonResponse;
  }
  static Future<dynamic>sendMultipartRequest({
    required RequestType type,
    required String rout,
    Map<String,String>?headers,
    Map<String,dynamic>?params,
    Map<String,String>?fields,//todo text
    Map<String,String>?files,//file
  })async{
    try{
      var request=http.MultipartRequest(
        type.toString(),Uri.https(baseUrl,rout,params));
        var _filesKeyList = files!.keys.toList();
      var _filesNameList = files.values.toList();
        for (int i = 0; i < _filesNameList.length; i++) {
          if(_filesNameList[i].isNotEmpty){
          var multipartFile =http.MultipartFile.fromPath(
           _filesKeyList[i], //todo image_profile
            _filesNameList[i], //* File path
              filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
            request.files.add(await multipartFile);}
        }
         //? C://user/images/user.png
      //* path.basename(C://user/images/user.png) => user.png

      request.fields.addAll(fields!); //? (Text type) first_name => Hazem
      request.headers.addAll(headers!);
      var response = await request.send();
      var value = await response.stream.bytesToString();


      Map<String, dynamic> responseJson = {};
      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      BotToast.showText(text: error.toString());
    }
  }

  static MediaType getContentType(String name) {
    //todo=> user.png
    //todo=> user.png.split('.')  ["user","png"]
    //todo=> ["user","png"].last => Png

    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }

    }
  
