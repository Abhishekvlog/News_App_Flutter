import 'package:demo/page/BreakingNews.dart';
import 'package:demo/page/Source.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
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
              breaking(),
              source()
            ],
          ),
      ),
      ),
    );
  }
}
