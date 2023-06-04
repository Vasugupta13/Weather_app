import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
    String urlString = url;
    Uri uri = Uri.parse(urlString);
    http.Response response =await http.get(uri);
    if(response.statusCode==200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      if(kDebugMode){
        print(response.statusCode);
      }
    }
  }



}