import 'package:bloc/bloc.dart';
import 'package:demo/Service/ApiClient.dart';
import 'package:demo/model/News.dart';
import 'package:meta/meta.dart';

part 'news_service_state.dart';

class NewsServiceCubit extends Cubit<NewsServiceState> {

  final ApiService _apiService;
  NewsServiceCubit(this._apiService) : super(NewsServiceInitial());
  
  final deo = "sfjksdfjsl";
  void FetchIntialpage()async{

  late List<News> newsList;
   try {
       newsList=  await _apiService.getNewsList("a", 1);

       emit(NewsServiceNewsLoaded(newsList: newsList));

   } catch (e) {
            emit(NewsServiceNewsLoadFailed(message: e.toString()));
   }

  }
   
//  void FetchNewspage({required int pageNO}){
//       _apiService.getNewsList("a", pageNO);

//   }

}


