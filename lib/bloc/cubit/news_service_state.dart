part of 'news_service_cubit.dart';

@immutable
abstract class NewsServiceState {}

class NewsServiceInitial extends NewsServiceState {}

class NewsServiceNewsLoaded extends NewsServiceState {
    NewsServiceNewsLoaded({required this.newsList});
    final List<News> newsList;
}
class NewsServiceNewsLoadFailed extends NewsServiceState {
    NewsServiceNewsLoadFailed({required this.message});
    final String message;
}



