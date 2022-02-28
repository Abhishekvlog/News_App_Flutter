import 'package:flutter/material.dart';
import '../model/News.dart';

class ItemDetail extends StatelessWidget {

  final News news;
  const ItemDetail({Key? key ,required this.news, }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Item Detail'),),
      body: Column(
        children: <Widget>[
          Image(image: NetworkImage(news.urlToImage)),
          SizedBox(height: 20),
          Text(news.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black,),),
          SizedBox(height: 10,),
          Text(news.content,style: TextStyle(fontSize: 16,color: Colors.black,),),
          SizedBox(height: 10,),
          Text(news.description,style: TextStyle(fontSize: 14,color: Colors.black54,),),
          SizedBox(height: 10,),
          Text('Produced by - '+news.author,style: TextStyle(fontSize: 12,),),
        ],
      ),
    );
  }

}

