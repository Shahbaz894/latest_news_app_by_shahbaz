

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/us_technology_news_model.dart';
import '../model/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository{


  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=25fb393900534d91a9b54df6571c4994";
    final response=await http.get(Uri.parse(url));
    // if(kDebugMode){
    //   print(response.body);
    // }
    if(response.statusCode== 200){
      final body=jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }


  //////////////////////////////////////////////////////////

  Future<UsTechnologyNewsModel> fetchUsTechnologyNewsApi() async{

    String url="https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=25fb393900534d91a9b54df6571c4994";

    final response=await http.get(Uri.parse(url));
    if(response.statusCode== 200){
      final body=jsonDecode(response.body);
      if(kDebugMode) {
        print(response.body);
      }
      return UsTechnologyNewsModel.fromJson(body);
    }
    throw Exception('Error data not receive from api');
  }
  ///////////////////////////////////////////////////////////////////////////////////////////



  Future<NewsChannelHeadlinesModel> fetchCategoryNews(String category) async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=25fb393900534d91a9b54df6571c4994";
    final response=await http.get(Uri.parse(url));
    // if(kDebugMode){
    //   print(response.body);
    // }
    if(response.statusCode== 200){
      final body=jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
