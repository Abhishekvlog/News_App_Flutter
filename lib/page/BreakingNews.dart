import 'package:demo/Service/ApiClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/News.dart';
import 'SearchItem.dart';

class breaking extends StatefulWidget {
  const breaking({Key? key}) : super(key: key);

  @override
  _breakingState createState() => _breakingState();
}

class _breakingState extends State<breaking> {

  late List<News> newsList;
  late List<News> DisplayNewsList;
  String q ='a';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: getNewsList(q),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (newsList.length == 0) {
                      return Center(
                        child: Text('No News found'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return index == 0 ? buildSearch() : SafeArea(child: Column(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text(newsList[index].title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black,),),
                                SizedBox(height: 20,),
                                Image(image: NetworkImage(
                                    newsList[index].urlToImage
                                ),),
                                SizedBox(height: 10,),
                                Text(newsList[index].content,style: TextStyle(fontSize: 16,color: Colors.black,),),
                                SizedBox(height: 10,),
                                Text(newsList[index].description,style: TextStyle(fontSize: 14,color: Colors.black54,),),
                                SizedBox(height: 10,),
                                Text('Produced by - '+newsList[index].author,style: TextStyle(fontSize: 12,),),
                                SizedBox(height: 30.0,
                                  width: 350.0,
                                  child: Divider(
                                    color: Colors.black,
                                  ),),
                              ],
                            ));
                          });
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(' ${snapshot.error} '),
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

  getNewsList(String s) async {
    newsList = await ApiService().getNewsList(s);
    return newsList;
  }

  Widget buildSearch() => SearchWidget(
    text :q,
    hintText : 'Search here....',
    onChanged: (q) async {
      final news = await ApiService().getNewsList(q);
      if(!mounted) return;
      q = q.toLowerCase();
      setState(() {
        this.q = q;
        DisplayNewsList = news;
      });
    },
  );




}

