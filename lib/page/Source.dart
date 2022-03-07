import 'package:demo/bloc/cubit/news_service_cubit.dart';
import 'package:flutter/material.dart';
import '../model/News.dart';
import 'item_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceTab extends StatelessWidget {
  late List<News> newsList;
  int page =1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<NewsServiceCubit, NewsServiceState>(
                builder: (context, state) {
                  if (state is NewsServiceNewsLoaded) {
                    if (state.newsList.length == 0) {
                      return Center(
                        child: Text('No News found'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: state.newsList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (p) => ItemDetail(news: state.newsList[index],)));
                              },
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: FadeInImage(
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                  placeholder: AssetImage("images/news.jpg"),
                                  image:
                                  NetworkImage(state.newsList[index].urlToImage),
                                ),
                              ),
                              title: Text(
                                state.newsList[index].title,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          });
                    }
                  } else if (state is NewsServiceNewsLoadFailed) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getNewsList(String s) async {
  //   newsList = await ApiService().getNewsList(s,page
  //   );
  //   return newsList;
  // }
}


//
// else {
// return ListView.builder(
// itemCount: newsList.length,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return ListTile(
// onTap: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (p) => ItemDetail(news: newsList[index],)));
// },
// leading: ClipRRect(
// borderRadius: BorderRadius.circular(8),
// child: FadeInImage(
// height: 100,
// width: 100,
// fit: BoxFit.fill,
// placeholder: AssetImage("images/news.jpg"),
// image:
// NetworkImage(newsList[index].urlToImage),
// ),
// ),
// title: Text(
// newsList[index].title,
// style: TextStyle(
// color: Colors.black87,
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// );
// });
// }
