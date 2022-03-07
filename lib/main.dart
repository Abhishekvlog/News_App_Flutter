import 'package:demo/Service/ApiClient.dart';
import 'package:demo/bloc/cubit/news_service_cubit.dart';
import 'package:demo/page/BreakingNews.dart';
import 'package:demo/page/Source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsServiceCubit(ApiService())..FetchIntialpage(),
        child: homepage(),
      ),
    );
  }
}


class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
        backgroundColor: Colors.white54,
          appBar: AppBar(
            title: Text('News Application'),
            centerTitle: true,
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Breaking News',),
                Tab(text: 'Source',)
              ],
            ),
          ),
          body: TabBarView(
            children:<Widget> [
              BreakingTab(),
              SourceTab()
            ],
          ),
      ),
      ),
    );
  }
}
