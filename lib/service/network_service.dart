import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';
class Network{

  static bool isTester = true;

  /// real server
  static String SERVER_DEVELOPMENT= "jsonplaceholder.typicode.com";

  /// test server
  static String SERVER_PRODUCTION = "jsonplaceholder.typicode.com";


  /// server bilan bog'lanish uchun key
  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    return headers;
  }

  /// serverni aniqlab qaysi serverligini qaytaradigan function
  static getServer(){
    if(isTester){
      return SERVER_DEVELOPMENT;
    }
    return SERVER_PRODUCTION;
  }

  /*
  Http Request
   */

  /// GET dan biz quyidagi holatlarda foydalanamiz serverdagi
  /// bor malumotni biz suraganda u bizga malumot qaytaradi agar malumot bulmasa null qaytaradi
  static Future<String?> GET(String api)async{
    var uri=Uri.https(getServer(), api);
    var response=await get(uri,headers: getHeaders());
    if(response.statusCode==200)
      return response.body;
    return null;
  }

/// POST bu funksiya biz bazada yuq qiymat beramiz va u bizga id quyib qaytaradi
  static Future<String?> POST(String api,Map<String, String>parms)async{
    var uri=Uri.https(getServer(), api);
    var response=await post(uri,headers: getHeaders(),body:jsonEncode(parms) );
    if(response.statusCode==200 ||response.statusCode==201)
      return response.body;
    return null;
  }

/// Buz funksiya POST qilib chiqarilgan malumotni yangilashda foydalaniladi
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response =
    await put(uri, headers: getHeaders(), body: jsonEncode(params));


    if (response.statusCode == 201||response.statusCode==200) return response.body;
    return null;
  }


  /* Http Apis */
  static String API_LIST = "/posts";/// get uchun
  static String API_CREATE = "/posts";/// post uchun
  static String API_UPDATE = "/posts/"; //{id} put uchun
  static String API_DELETE = "/posts/"; //{id} for DEL function

  /// metidlar uchun funksiyalar

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }


  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }
  static createNote(){

}

}