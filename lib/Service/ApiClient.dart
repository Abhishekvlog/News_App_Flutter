import 'dart:convert';
import 'dart:developer';
import 'package:demo/model/News.dart';
import 'package:http/http.dart' as http;

class ApiService{

  static String BASE_URL = 'https://newsapi.org/v2/everything?q=';
  getNewsList(String q) async{
    var respone = await http.get(Uri.parse(BASE_URL+q + '&apiKey=90b71e0a0ff34c248e699ddd46014b65'));
    if(respone.statusCode == 200){
      List<News> newsList;
      var result = jsonDecode(respone.body);
      newsList = (result['articles'] as List ).map((i) => News.fromJson(i)).toList();
      log('${newsList.length}');
      print('${newsList.length}');
      return newsList;
    }
  }
}