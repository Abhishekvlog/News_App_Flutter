// import 'package:demo/Service/ApiClient.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../model/News.dart';
// import 'SearchItem.dart';

// class BreakingTab extends StatefulWidget {
//   const BreakingTab({Key? key}) : super(key: key);

//   @override
//   _BreakingTabState createState() => _BreakingTabState();
// }

// class _BreakingTabState extends State<BreakingTab> {
//   late List<News> newsList;
//   int page =1;
//   late List<News> DisplayNewsList;
//  final ScrollController scrollController = new ScrollController();
//   String q = 'a';

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(() {
//       if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
//         print("We are in the last");
//         getNewsList(q);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     scrollController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: FutureBuilder(
//                   future: getNewsList(q),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       if (newsList.length == 0) {
//                         return Center(
//                           child: Text('No News found'),
//                         );
//                       } else {
//                         return ListView.builder(
//                           controller: scrollController,
//                             itemCount: newsList.length,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return index == 0
//                                   ? buildSearch()
//                                   : SafeArea(
//                                       child: Column(
//                                       children: <Widget>[
//                                         SizedBox(height: 20),
//                                         Text(
//                                           newsList[index].title,
//                                           style: TextStyle(
//                                             fontSize: 22,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Image(
//                                           image: NetworkImage(
//                                               newsList[index].urlToImage),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           newsList[index].content,
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           newsList[index].description,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           'Produced by - ' +
//                                               newsList[index].author,
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 30.0,
//                                           width: 350.0,
//                                           child: Divider(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ],
//                                     ));
//                             });
//                       }
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Please check Internet Connection'),
//                       );
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//       ),
//     );
//   }

//   getNewsList(String s) async {
//     page++;
//     newsList = await ApiService().getNewsList(s,page);
//     print("Api is calling and page number is $page");
//     return newsList;
//   }

//   Widget buildSearch() => SearchWidget(
//         text: q,
//         hintText: 'Search here....',
//         onChanged: (q) async {
//           final news = await ApiService().getNewsList(q,page);
//           if (!mounted) return;
//           q = q.toLowerCase();
//           setState(() {
//             this.q = q;
//             DisplayNewsList = news;
//           });
//         },
//       );
// }





import 'package:demo/Service/ApiClient.dart';
import 'package:demo/bloc/cubit/news_service_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/News.dart';
import 'SearchItem.dart';



class BreakingTab extends StatelessWidget {
  int page =1;
  late List<News> DisplayNewsList;
 final ScrollController scrollController = new ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
  //       print("We are in the last");
  //       getNewsList(q);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   scrollController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: 
                BlocBuilder<NewsServiceCubit, NewsServiceState>(
                  builder: (context, state) {
                    if (state is NewsServiceNewsLoaded) {
                      if (state.newsList.length == 0) {
                        return Center(
                          child: Text('No News found'),
                        );
                      } else {
                        return ListView.builder(
                          controller: scrollController,
                            itemCount: state.newsList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return index == 0
                                  ?SizedBox( )   // Implement searching
                                  : SafeArea(
                                      child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        Text(
                                          state.newsList[index].title,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Image(
                                          image: NetworkImage(
                                              state.newsList[index].urlToImage),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                         state.newsList[index].content,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                         state.newsList[index].description,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Produced by - ' +
                                              state.newsList[index].author,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                          width: 350.0,
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ));
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

  

  // Widget buildSearch() => SearchWidget(
  //       text: q,
  //       hintText: 'Search here....',
  //       onChanged: (q) async {
  //         final news = await ApiService().getNewsList(q,page);
  //         if (!mounted) return;
  //         q = q.toLowerCase();
  //         setState(() {
  //           this.q = q;
  //           DisplayNewsList = news;
  //         });
  //       },
  //     );
}
