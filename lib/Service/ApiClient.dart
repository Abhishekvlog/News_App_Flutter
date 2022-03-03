import 'dart:convert';
import 'package:demo/model/News.dart';
import 'package:http/http.dart' as http;
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

class ApiService {
  static String BASE_URL = 'https://newsapi.org/v2/everything?q=';
  static int current_page =1;

  getNewsList(String q,current_page) async {

    var isCacheExist =  await APICacheManager().isAPICacheKeyExist("Api_Categories");

    if(!isCacheExist){
      var respone = await http.get(
          Uri.parse(BASE_URL + q + '&apiKey=90b71e0a0ff34c248e699ddd46014b65&page=$current_page'));

      if (respone.statusCode == 200) {
        APICacheDBModel cacheDBModel = new APICacheDBModel(
          key : "Api_Categories",
          syncData: respone.body,
        );

        await APICacheManager().addCacheData(cacheDBModel);
        List<News> newsList;
        var result = jsonDecode(respone.body);
        newsList = (result['articles'] as List).map((i) => News.fromJson(i)).toList();
        print('${newsList.length}');

        return newsList;
      }
    }
    else{
      
      var cacheData = await APICacheManager().getCacheData("Api_Categories");
      List<News> newsList;
      var result = jsonDecode(cacheData.syncData);
      newsList = (result['articles'] as List).map((i) => News.fromJson(i)).toList();
      return newsList;
    }

  }
}
